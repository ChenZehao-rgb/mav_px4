#include "mav_offboard/mav_offboard.h"
#include <mpl_basis/primitive.h>
#include <mpl_traj_solver/traj_solver.h>
#include "ros/ros.h"
#include "mav_offboard/GenTrajOnline.h"
#include "mav_offboard/MavOffbCtlType.h"

#define CONTROL_LOOP_RATE 20.0
#define CMD_LOOP_TIME 1.0 / CONTROL_LOOP_RATE
#define TRAJ_ERROR_TOLERATE_XY 1.5
#define TRAJ_ERROR_TOLERATE_Z 1.5
const int CONST_INTER_STEP = 20;

void quat2RPY(const geometry_msgs::Quaternion &quat, double &roll,
              double &pitch, double &yaw) {
  tf::Quaternion q(quat.x, quat.y, quat.z, quat.w);
  tf::Matrix3x3 m(q);
  m.getRPY(roll, pitch, yaw);
  return;
}


//Here, the names of topics don't start with "/", indicating that 
// they are relative paths, which can be prefixed by namespace!
// 构造函数，可以在创建节点程序中调用，只要传入节点句柄即可
MavOffboard::MavOffboard(const ros::NodeHandle &nh)  //首先，类后加:表示初始化列表，可使用括号或花括号直接初始化成员变量
    : isSim_(true),
      nh_(nh),
      isOffboardReady_(false),
      isSetpointReady_(false),
      isSetpointUpdate_(false),
      isWayPointsReady_(false),
      isgetSetpointsRawLocal_(false),
      isSetpointsGenetate_(false),
      timeStep_(0.02){
        //订阅者uavPoseLocalSub_，订阅topic为"mavros/local_position/pose"，消息类型为geometry_msgs::PoseStamped
    uavPoseLocalSub_ = nh_.subscribe("mavros/local_position/pose",10,
                                        &MavOffboard::uavPoseLocalCb,this,
                                        ros::TransportHints().tcpNoDelay());
    uavTwistLocalSub_ = nh_.subscribe("mavros/local_position/velocity_local",10,
                                        &MavOffboard::uavTwistLocalCb,this,
                                        ros::TransportHints().tcpNoDelay());
    fcuStateSub_ = nh_.subscribe("mavros/state",10,&MavOffboard::fcuStateCb,
                                    this,ros::TransportHints().tcpNoDelay());
    targPointLocalSub_ = nh_.subscribe("mav_offboard/targ_point_local",10,
                                        &MavOffboard::targPointLocalCb,this,
                                        ros::TransportHints().tcpNoDelay());
    rtkDateLinkSub_ = nh_.subscribe("mavros/gpsstatus/gps1/raw", 10,
                                  &MavOffboard::rtkDateLinkCb, this,
                                  ros::TransportHints().tcpNoDelay());
    
    trajGeneratorClient_ = nh_.serviceClient<mav_offboard::GenTrajOnline>(
                            "online_traj_generator/gen_traj_online");
    fcuArmingClient_ =
      nh_.serviceClient<mavros_msgs::CommandBool>("mavros/cmd/arming");
    fcuSetModeClient_ =
      nh_.serviceClient<mavros_msgs::SetMode>("mavros/set_mode");
    setwayPointsClient_ = nh_.serviceClient<mav_offboard::IintWayPoints>(
      "mav_offboard/set_init_way_points");
    
    setpointLocalPub_ = nh_.advertise<geometry_msgs::PoseStamped>(
      "mavros/setpoint_position/local", 10);
    setpointRawLocalPub_ = nh_.advertise<mavros_msgs::PositionTarget>(
      "mavros/setpoint_raw/local", 10);
    setpointsRawLocalPub_ = nh_.advertise<mavros_msgs::PositionTarget>(
      "mavros/setpoint_raw/local", 100);
    interpolationPointPub_ = nh_.advertise<geometry_msgs::Vector3>(
      "mav_offboard/inter_points", 10);

    setOffbCtlTypeSer_ = nh_.advertiseService("mav_offboard/set_offb_ctl_type",
                                            &MavOffboard::setOffbCtlType, this);
    setTargPointSer_ = nh_.advertiseService("mav_offboard/set_targ_point",
                                          &MavOffboard::setTargPoint, this); //setTargPoint是所编写的服务函数
    initWayPointsSer_ = nh_.advertiseService(
      "mav_offboard/set_init_way_points", &MavOffboard::setInitWayPoints, this);

    cmdLoopTimer_ = nh_.createTimer(ros::Duration(CMD_LOOP_TIME),
                                  &MavOffboard::cmdLoopCb, this);
    fcuStateLoopTimer_ = nh_.createTimer(ros::Duration(CMD_LOOP_TIME),
                                       &MavOffboard::fcuStateLoopCb, this);

    init();
    }
MavOffboard::~MavOffboard(){};

// 传递参数isSim给成员变量isSim_
void MavOffboard::setSim(const bool &isSim){ isSim_ = isSim;}


void MavOffboard::run(){
  //等待5s，保证其他节点都已经启动
    ros::Duration(5.0).sleep();
  //每1s执行一次循环
    while(ros::ok()){
        // ros::Duration(1.0).sleep();
        ros::spinOnce();
    }
}

// 初始化控制器类型
void MavOffboard::init(){
    ctlType_.mav_offb_ctl_type = mav_offboard::MavOffbCtlType::GOTO_SETPOINTS_SMOOTH;
    // ctlType_.mav_offb_ctl_type = MavOffbCtlType::OFFBOARD_IGNORE;
    // ctlType_.mav_offb_ctl_type = mav_offboard::MavOffbCtlType::GOTO_SETPOINT_STEP;
    // ctlType_.mav_offb_ctl_type = MavOffbCtlType::GOTO_SETPOINT_SMOOTH;
}
// 通过回调函数获取无人机的本地位置
void MavOffboard::uavPoseLocalCb(const geometry_msgs::PoseStamped::ConstPtr &msg){
    uavPoseLocal_ = *msg;
    ROS_INFO_STREAM_THROTTLE(5, "MavOffboard::uavPoseLocalCb: uavPoseLocal_: " << uavPoseLocal_);
}
// 通过回调函数获取无人机的本地速度
void MavOffboard::uavTwistLocalCb(const geometry_msgs::TwistStamped::ConstPtr &msg){
    uavTwistLocal_ = *msg;
}
// 通过回调函数获取飞控的状态
void MavOffboard::fcuStateCb(const mavros_msgs::State::ConstPtr &msg){
    fcuState_ = *msg;
}
// 通过回调函数获取目标点的位置，并将目标点的姿态设置为无人机的姿态
void MavOffboard::targPointLocalCb(const geometry_msgs::PoseStamped::ConstPtr &msg){
    setpointLocal_ = *msg;
    setpointLocal_.pose.orientation = uavPoseLocal_.pose.orientation;
}
// 通过回调函数获取rtkDate_的值，gps的原始数据
void MavOffboard::rtkDateLinkCb(const mavros_msgs::GPSRAW::ConstPtr &msg){
    rtkDate_ = *msg;
}
// 设置控制器类型, service server
bool MavOffboard::setOffbCtlType(
    mav_offboard::SetMavOffbCtlType::Request &req,
    mav_offboard::SetMavOffbCtlType::Response &res
){
  ctlType_ = req.ctlType;
  res.success = true;
  ROS_INFO_STREAM_THROTTLE(5, "MavOffboard::setOffbCtlType: ctlType_: " << ctlType_);
  return true;
}
// service server，设置目标点到全局变量setpointLocal_,并将isSetpointReady_设置为true
bool MavOffboard::setTargPoint(
    mav_offboard::SetTargPoint::Request &req,
    mav_offboard::SetTargPoint::Response &res){
  setpointLocal_ = req.targPoint;
  isSetpointReady_ = true;
  isSetpointUpdate_ = true;
  res.success = true;
  ROS_INFO_STREAM_THROTTLE(5,
      "MavOffboard::setTargPoint: targPointLocal_: " << setpointLocal_);
  return true;
}
// 设置初始路径点,service server
bool MavOffboard::setInitWayPoints(
    mav_offboard::IintWayPoints::Request &req,
    mav_offboard::IintWayPoints::Response &res){
  if(req.initWayPoints.size() == 0){
    ROS_ERROR_STREAM("MavOffboard::setInitWayPoints: req.initWayPoints.size() == 0");
    return false;
  }
  traPoints_.clear();
  ROS_INFO_STREAM("get points");
  // 函数遍历请求中的每个航点，将其位置（x, y, z）提取出来并存储到一个临时的 Vec3f 对象中，然后将该对象添加到 traPoints_ 列表中
  for (auto iter = req.initWayPoints.begin(); iter != req.initWayPoints.end(); iter++){
    Vec3f temp;
    temp.x() = iter->pose.position.x;
    temp.y() = iter->pose.position.y;
    temp.z() = iter->pose.position.z;
    traPoints_.push_back(temp);
  }
  isWayPointsReady_ = true;
  isgetSetpointsRawLocal_ = false;
  isSetpointsGenetate_ = false;
  res.success = true;
  
  return true;
}
// service client,调用trajGeneratorClient_的服务，获取setpointRawLocal_
bool MavOffboard::getSetpointRawLocal(){
  mav_offboard::GenTrajOnline srv;
  srv.request.targPoint = setpointLocal_;
  srv.request.pose = uavPoseLocal_;
  srv.request.twist = uavTwistLocal_;
  if(isSetpointUpdate_){
    srv.request.isUpdateState = true;
    isSetpointUpdate_ = false;
  }else{
    srv.request.isUpdateState = false;
  }

  if(!trajGeneratorClient_.call(srv)){
    ROS_WARN_STREAM("MavOffboard::getSetpointRawLocal: call trajGen failed");
    return false;
  }

  setpointRawLocal_ = srv.response.setPointRaw;
  return true;
}
// 生成航点，处理存储在 traPoints_ 中的航点，生成一系列的航点，并将这些航点存储到 path_ 中,并通过interpolationPointPub_发布
void MavOffboard::getSetpointsRawLocal(){
  isgetSetpointsRawLocal_ = true;

  for (auto iter = traPoints_.begin(); iter != (traPoints_.end() - 1); iter++) {
    Vec3f temp;
    Vec3f pushTemp = *iter;
    temp = (*(iter + 1) - *iter).normalized();
    while (temp.dot(*(iter + 1) - (pushTemp)) > 0) {
      path_.push_back(pushTemp);
      // ROS_INFO_STREAM("pushTemp:"<<pushTemp);
      geometry_msgs::Vector3 interpolationPoint;
      interpolationPoint.x = pushTemp(0,0);
      interpolationPoint.y = pushTemp(1,0);
      interpolationPoint.z = pushTemp(2,0);
      interpolationPointPub_.publish(interpolationPoint);
      pushTemp = pushTemp + CONST_INTER_STEP * temp;
    }
  }
  auto iter = traPoints_.end()-1;
  Vec3f lastPushTemp = *iter;
  // ROS_INFO_STREAM("iter:"<<lastPushTemp);
  path_.push_back(lastPushTemp);
}

/*getSetpointsRawLocal()获取path_中的航点，然后调用TrajSolver3D类的solve()函数生成轨迹traj_，
并通过调用traj_的evaluate()函数获取下一个轨迹点，然后调用pointToMsg()函数将轨迹点转换为消息格式，发布到setpointsRawLocalPub_上*/
void MavOffboard::solveAndsendTraj(){
  if (!isSetpointsGenetate_) {
    TrajSolver3D traj_solver(Control::VEL);
    traj_solver.setPath(path_);
    traj_solver.setV(6); // 速度参数
    traj_ = traj_solver.solve(); //参数为true，打印轨迹信息
    auto prims = traj_.getPrimitives();
    isSetpointsGenetate_ = true;
    // debug info
    // ROS_INFO_STREAM("MavOffboard::solveAndsendTraj: Min-jrk traj total_time: "
    //                 << traj_.getTotalTime());
    // ROS_INFO_STREAM("MavOffboard::solveAndsendTraj: Min-jrk traj prims: ");
    // for (auto iter = prims.begin(); iter != prims.end(); iter++) {
    //   print(*iter);
    //   print_max(*iter);
    //   ROS_INFO_STREAM("=================================");
    // }
    auto nextStepPoint = traj_.evaluate(timeStep_); //timeStep_ = 0.02，在初始化列表中初始化
    timeStep_ += CMD_LOOP_TIME;
    pointToMsg(nextStepPoint);
    ROS_INFO_STREAM("jrktotal_time:" << traj_.getTotalTime());
  } else {
    if (timeStep_ < traj_.getTotalTime()) {
      auto nextStepPoint = traj_.evaluate(timeStep_);
      ROS_INFO_STREAM_THROTTLE(
          15, "MavOffboard::solveAndsendTraj: traj at time(s): "
                  << timeStep_ << std::endl
                  << "pos: " << std::endl
                  << nextStepPoint.pos);
      timeStep_ += CMD_LOOP_TIME;
      pointToMsg(nextStepPoint);
    } else {
      ROS_INFO_STREAM_THROTTLE(
          2, "MavOffboard::solveAndsendTraj: send last waypoint !");
      auto nextStepPoint = traj_.evaluate(traj_.getTotalTime() - 0.05);
      pointToMsg(nextStepPoint);
    }
  }
}
// 将轨迹点转换为消息格式，根据轨迹点的位置、速度、加速度、姿态，设置setpointsRawLocal_的各个成员变量，然后发布到setpointsRawLocalPub_上
void MavOffboard::pointToMsg(const Waypoint<3> &point){
  setpointsRawLocal_.header.stamp = ros::Time::now();
  setpointsRawLocal_.coordinate_frame = 
      mavros_msgs::PositionTarget::FRAME_LOCAL_NED;
  setpointsRawLocal_.type_mask = mavros_msgs::PositionTarget::IGNORE_YAW |
                                 mavros_msgs::PositionTarget::IGNORE_YAW_RATE;
  setpointsRawLocal_.position.x = point.pos[0];
  setpointsRawLocal_.position.y = point.pos[1];
  setpointsRawLocal_.position.z = point.pos[2];

  setpointsRawLocal_.velocity.x = point.vel[0];
  setpointsRawLocal_.velocity.y = point.vel[1];
  setpointsRawLocal_.velocity.z = point.vel[2];

  setpointsRawLocal_.acceleration_or_force.x = point.acc[0];
  setpointsRawLocal_.acceleration_or_force.y = point.acc[1];
  setpointsRawLocal_.acceleration_or_force.z = point.acc[2];
  double rollCurr , pitchCurr , yawCurr;
  //uavPoseLocal_是无人机的本地位置，是全局变量
  quat2RPY(uavPoseLocal_.pose.orientation, rollCurr, pitchCurr, yawCurr);
  setpointsRawLocal_.yaw = yawCurr;
  setpointsRawLocalPub_.publish(setpointsRawLocal_);
}
// 输入posRef和velRef，计算errpos和errvel，然后计算accfb，限制accfb的最大值为5.0，计算accDes，根据accDes和yaw计算rotmat，最后计算quatCmd
void MavOffboard::posController(Eigen::Quaterniond &quatCmd, const Eigen::Vector3d &posRef,
                     const Eigen::Vector3d &velRef){
  const double g = 9.8;
  const double accfbMax = 5.0;
  Eigen::Vector3d pos;
  Eigen::Vector3d vel;
  tf::pointMsgToEigen(uavPoseLocal_.pose.position, pos);
  tf::vectorMsgToEigen(uavTwistLocal_.twist.linear, vel);

  double roll, pitch, yaw;
  quat2RPY(uavPoseLocal_.pose.orientation, roll, pitch, yaw);

  Eigen::Vector3d gVe3(0.0, 0.0, g); // gravity vector in earth frame
  Eigen::Vector3d kPos(4.0, 4.0, 4.0);
  Eigen::Vector3d kVel(4.0, 4.0, 4.0);

  const Eigen::Vector3d errPos = pos - posRef;
  const Eigen::Vector3d errVel = vel - velRef;

  Eigen::Vector3d accfb =
      kPos.asDiagonal() * errPos + kVel.asDiagonal() * errVel;
  //限制反馈加速度最大值为accfbMax
  if (accfb.norm() > accfbMax) accfb = (accfbMax / accfb.norm()) * accfb;
  // 期望加速度,反馈加速度减去重力加速度
  Eigen::Vector3d accDes = accfb - gVe3;
  // 期望旋转矩阵，根据期望加速度和yaw角计算
  Eigen::Matrix3d rotmat = accDes2Rotmat(accDes, yaw);
  // 期望四元数
  Eigen::Quaterniond quat(rotmat);
  // 期望四元数赋值给quatCmd
  quatCmd = quat;
}

Eigen::Matrix3d MavOffboard::accDes2Rotmat(const Eigen::Vector3d &accDes,
                                           const double &yaw) {
  Eigen::Vector3d xbDes, ybDes, zbDes;
  Eigen::Vector3d xbDesProj;
  Eigen::Matrix3d rotmat;

  xbDesProj << std::cos(yaw), std::sin(yaw), 0.0;

  zbDes = accDes / accDes.norm();
  // zbDes与xbDesProj叉乘，得到垂直于xbDesProj和zbDes的向量，再将其单位化，得到ybDes
  ybDes = zbDes.cross(xbDesProj) / (zbDes.cross(xbDesProj)).norm();
  // ybDes与zbDes叉乘，得到垂直于ybDes和zbDes的向量，再将其单位化，得到xbDes
  xbDes = ybDes.cross(zbDes) / (ybDes.cross(zbDes)).norm();

  rotmat << xbDes(0), ybDes(0), zbDes(0), xbDes(1), ybDes(1), zbDes(1),
      xbDes(2), ybDes(2), zbDes(2);
  return rotmat;
}
// 控制循环回调函数，根据控制器类型，执行不同的控制器
void MavOffboard::cmdLoopCb(const ros::TimerEvent &event){
  ros::Rate loopRate(20.0); // 循环频率20Hz
  while((ros::ok() && !isSetpointReady_) &&
        (ros::ok() && !isWayPointsReady_)){
    if (fcuState_.mode != "OFFBOARD") {
      setpointLocalPub_.publish(uavPoseLocal_);
      lastLocalPose_ = uavPoseLocal_;
    }else{
      setpointLocalPub_.publish(lastLocalPose_);
      setpointRawLocal_.position = uavPoseLocal_.pose.position;
      ROS_INFO_STREAM_THROTTLE(5,"Offboard Control Mode is valid and set lastLocalPose !");
    }
    loopRate.sleep();
  }

  switch (ctlType_.mav_offb_ctl_type){
    case mav_offboard::MavOffbCtlType::GOTO_SETPOINT_STEP: {
    //更新setpointRawLocal_的时间戳，并发布到setpointRawLocalPub_上
    //setpointLocal_是目标点，通过服务器setTargPoint()设置
      setpointLocal_.header.stamp = ros::Time::now();
      setpointLocalPub_.publish(setpointLocal_);
      ROS_INFO_STREAM_THROTTLE(
          10, "MavOffboard::cmdLoopCb: CtlType is GOTO_SETPOINT_STEP");
      break;
    }
    case mav_offboard::MavOffbCtlType::GOTO_SETPOINT_SMOOTH: {
      //调用getSetpointRawLocal()函数，获取setpointRawLocal_
      getSetpointRawLocal();
      //更新setpointRawLocal_的时间戳/坐标系/掩码，并发布到setpointRawLocalPub_上
      setpointRawLocal_.header.stamp = ros::Time::now();
      setpointRawLocal_.coordinate_frame =
          mavros_msgs::PositionTarget::FRAME_LOCAL_NED;
      setpointRawLocal_.type_mask =
          mavros_msgs::PositionTarget::IGNORE_YAW_RATE;
      
      ROS_INFO_STREAM_THROTTLE(
          10, "MavOffboard::cmdLoopCb: setpointRawLocal_" << setpointRawLocal_);

      setpointRawLocalPub_.publish(setpointRawLocal_);

      ROS_INFO_STREAM_THROTTLE(
          10, "MavOffboard::cmdLoopCb: CtlType is GOTO_SETPOINT_SMOOTH");
      break;
    }
    case mav_offboard::MavOffbCtlType::GOTO_SETPOINTS_STEP: {
      break;
    }
    case mav_offboard::MavOffbCtlType::GOTO_SETPOINTS_SMOOTH: {
      //如果航点未准备好，直接返回
      if(!isWayPointsReady_){
        return;
      }
      //如果未获取setpointsRawLocal_，调用getSetpointsRawLocal()函数，获取setpointsRawLocal_
      if(!isgetSetpointsRawLocal_){
        getSetpointsRawLocal();
      }
      //调用solveAndsendTraj()函数，生成轨迹并发布到setpointsRawLocalPub_上
      solveAndsendTraj();

      ROS_INFO_STREAM_THROTTLE(
          10, "MavOffboard::cmdLoopCb: CtlType is GOTO_SETPOINTS_SMOOTH");
      break;
    }
    case mav_offboard::MavOffbCtlType::POS_CTRL_BY_ATT: {
      if (isSim_) {
        setFcuOffbArm4Sim();
      }
      setpointRawAtt_.header.stamp = ros::Time::now();
      setpointRawAtt_.type_mask =
          mavros_msgs::AttitudeTarget::IGNORE_ROLL_RATE |
          mavros_msgs::AttitudeTarget::IGNORE_PITCH_RATE |
          mavros_msgs::AttitudeTarget::IGNORE_YAW_RATE |
          mavros_msgs::AttitudeTarget::IGNORE_THRUST;
      ROS_INFO_STREAM_THROTTLE(
          10, "MavOffboard::cmdLoopCb: setpointRawLocal_" << setpointRawLocal_); //打印setpointRawLocal_中的信息用于调试
      setpointRawLocalPub_.publish(setpointRawLocal_);
      ROS_INFO_STREAM_THROTTLE(
          10, "MavOffboard::cmdLoopCb: CtlType is GOTO_SETPOINT_SMOOTH");
      break;
    }
    case mav_offboard::MavOffbCtlType::POS_CTRL_BY_BODY_RATE: {
      break;
    }
    default:
      break;
  }
  return;
}

void MavOffboard::fcuStateLoopCb(const ros::TimerEvent &event){
  if (!isSetpointReady_ && !isWayPointsReady_) {
    return;
  }
  ROS_INFO_STREAM_THROTTLE(5,"rtkDate_.fix_type:"<<(int)rtkDate_.fix_type);
  if(fcuState_.mode == "AUTO.LOITER" &&
      (int)rtkDate_.fix_type == 3){
        if(setFcuOffboard()){
          ROS_INFO_STREAM_THROTTLE(
          0.2, "MavOffboard::fcuStateLoopCb:  Offboard reenabled!!");
        }
      }
}

bool MavOffboard::setFcuOffboard() {
  mavros_msgs::SetMode offbSetMode;
  offbSetMode.request.custom_mode = "OFFBOARD";

  if (fcuSetModeClient_.call(offbSetMode) && offbSetMode.response.mode_sent) {
    // ROS_INFO_STREAM("OFFBOARD enabled !");
    ROS_INFO_STREAM_THROTTLE(3, "mode:" << fcuState_);
    return true;
  } else {
    ROS_INFO_STREAM("OFFBOARD disenabled !");
    return false;
  }
}

bool MavOffboard::setFcuArm() {
  mavros_msgs::CommandBool armCmd;
  armCmd.request.value = true;
  if (fcuArmingClient_.call(armCmd) && armCmd.response.success) {
    return true;
  } else {
    return false;
  }
}

void MavOffboard::setFcuOffbArm4Sim() {
  if (fcuState_.mode != "OFFBOARD") {
    if (setFcuOffboard()) {
      ROS_WARN_STREAM("MavOffboard::setFcuOffbArm4Sim: Offboard enabled");
    }
  }
  if (!fcuState_.armed) {
    if (setFcuArm()) {
      ROS_WARN_STREAM("MavOffboard::setFcuOffbArm4Sim: Vehicle armed");
    }
  }
}