#ifndef MAV_OFFBOARD_H
#define MAV_OFFBOARD_H

#include <eigen_conversions/eigen_msg.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/PoseStamped.h> 
#include <geometry_msgs/Transform.h> 
#include <geometry_msgs/TwistStamped.h>
#include <mavros_msgs/AttitudeTarget.h> 
#include <mavros_msgs/CommandBool.h> 
#include <mavros_msgs/PositionTarget.h>
#include <mavros_msgs/SetMode.h> 
#include <mavros_msgs/State.h> 
#include <mavros_msgs/GPSRAW.h>
#include <mpl_basis/primitive.h>
#include <mpl_traj_solver/traj_solver.h>
#include <ros/ros.h> 
#include <std_srvs/SetBool.h>
#include <tf/tf.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <tf2_ros/transform_listener.h>
#include <geometry_msgs/Vector3.h> 
#include "geometry_msgs/Twist.h" 
#include <nav_msgs/Odometry.h> 
#include <cmath> 
#include <tf/transform_datatypes.h> 

#include "mav_offboard/IintWayPoints.h"
#include "mav_offboard/MavOffbCtlType.h"
#include "mav_offboard/SetTargPoint.h"
#include "mav_offboard/SetMavOffbCtlType.h"


class MavOffboard
{
public:
    MavOffboard(const ros::NodeHandle &nh);
    ~MavOffboard();

    void setSim(const bool &isSim);
    void run();

    bool isSim_;

private:
    void init();
    void uavPoseLocalCb(const geometry_msgs::PoseStamped::ConstPtr &msg);
    void uavTwistLocalCb(const geometry_msgs::TwistStamped::ConstPtr &msg);
    void fcuStateCb(const mavros_msgs::State::ConstPtr &msg);
    void rtkDateLinkCb(const mavros_msgs::GPSRAW::ConstPtr &msg);
    void targPointLocalCb(const geometry_msgs::PoseStamped::ConstPtr &msg);

    bool setOffbCtlType(mav_offboard::SetMavOffbCtlType::Request &req,
                      mav_offboard::SetMavOffbCtlType::Response &res);
    bool setTargPoint(mav_offboard::SetTargPoint::Request &req,
                    mav_offboard::SetTargPoint::Response &res);
    bool setInitWayPoints(mav_offboard::IintWayPoints::Request &req,
                        mav_offboard::IintWayPoints::Response &res);
    bool getSetpointRawLocal();
    void getSetpointsRawLocal();
    void solveAndsendTraj();
    void pointToMsg(const Waypoint<3> &point);

    void posController(Eigen::Quaterniond &quatCmd, const Eigen::Vector3d &posRef,
                     const Eigen::Vector3d &velRef);
    Eigen::Matrix3d accDes2Rotmat(const Eigen::Vector3d &vector_acc,
                                  const double &yaw);
    void cmdLoopCb(const ros::TimerEvent &event);

    void fcuStateLoopCb(const ros::TimerEvent &event);
    bool setFcuOffboard();
    bool setFcuArm();
    void setFcuOffbArm4Sim();

    double timeStep_;
    bool isOffboardReady_;
    bool isSetpointReady_;
    bool isSetpointUpdate_;
    bool isWayPointsReady_;
    bool isgetSetpointsRawLocal_;
    bool isSetpointsGenetate_;

    vec_Vec3f path_;
    std::vector<Vec3f> firgrouptraPoints_;
    std::vector<Vec3f> secgrouptraPoints_;
    std::vector<Vec3f> traPoints_;
    vec_E<Command3D> way_points;

    Trajectory3D traj_;

    mav_offboard::MavOffbCtlType ctlType_;
    geometry_msgs::PoseStamped uavPoseLocal_;
    geometry_msgs::PoseStamped lastLocalPose_;
    geometry_msgs::TwistStamped uavTwistLocal_;

    mavros_msgs::State fcuState_;
    mavros_msgs::GPSRAW rtkDate_;
    geometry_msgs::PoseStamped setpointLocal_;
    mavros_msgs::PositionTarget setpointRawLocal_; 
    mavros_msgs::PositionTarget setpointsRawLocal_;
    mavros_msgs::AttitudeTarget setpointRawAtt_;

    ros::NodeHandle nh_;
    ros::Subscriber uavPoseLocalSub_;
    // ros::Subscriber uavTwistSub_;

    ros::Subscriber uavTwistLocalSub_;
    ros::Subscriber fcuStateSub_;
    ros::Subscriber targPointLocalSub_;
    ros::Subscriber rtkDateLinkSub_;

    ros::ServiceClient trajGeneratorClient_;

    ros::ServiceClient fcuArmingClient_;
    ros::ServiceClient fcuSetModeClient_;
    ros::ServiceClient setwayPointsClient_;

    ros::Publisher setpointLocalPub_;
    ros::Publisher setpointRawLocalPub_;
    ros::Publisher setpointsRawLocalPub_;
    ros::Publisher setpointRawAttPub_;
    ros::Publisher interpolationPointPub_;

    ros::ServiceServer setOffbCtlTypeSer_;
    ros::ServiceServer setTargPointSer_;
    ros::ServiceServer initWayPointsSer_;

    ros::Timer cmdLoopTimer_;
    ros::Timer fcuStateLoopTimer_;  
};

#endif