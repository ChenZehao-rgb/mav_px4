#include <ros/ros.h>
#include "mav_offboard/SetTargPoint.h"
#include "mav_offboard/mav_offboard.h"

int main(int argc, char *argv[])
{
    ros::init(argc, argv, "goto_point_test_client");
    ros::NodeHandle nh;
    // 设置无人机解锁
    mavros_msgs::CommandBool armcmd;
    armcmd.request.value = true;
    ros::ServiceClient armingClient =
        nh.serviceClient<mavros_msgs::CommandBool>("/mavros/cmd/arming");
    if (armingClient.call(armcmd)) {
        ROS_INFO_STREAM("Arm success !");
    } else {
        ROS_INFO_STREAM("Arm fail !");
    }
    // 设置无人机模式
    mavros_msgs::SetMode setMode;
    setMode.request.custom_mode = "OFFBOARD";
    ros::ServiceClient setModeClient =
        nh.serviceClient<mavros_msgs::SetMode>("/mavros/set_mode");
    if (setModeClient.call(setMode)) {
        ROS_INFO_STREAM("Set mode success !");
    } else {
        ROS_INFO_STREAM("Set mode fail !");
    }
    // 设置目标点
    // 创建一个service client,service server在mav_offboard.cpp中定义，
    // ros::ServiceClient waypointsClient =
    //     nh.serviceClient<mav_offboard::SetTargPoint>( //SetTargPoint是通过srv文件自动生成的类
    //         "/mav_offboard/set_targ_point");// service server的名字
    // mav_offboard::SetTargPoint srv;
    // srv.request.targPoint.pose.position.x = 0;
    // srv.request.targPoint.pose.position.y = 0;
    // srv.request.targPoint.pose.position.z = 5;

    // srv.request.targPoint.pose.orientation.x = 0.0;
    // srv.request.targPoint.pose.orientation.y = 0.0;
    // srv.request.targPoint.pose.orientation.z = 0.0;
    // // srv.request.targPoint.pose.orientation.w = 1.0;

    // if (waypointsClient.call(srv)) {
    //     ROS_INFO_STREAM("call success !,uartPointLocal_:" << srv.request.targPoint);
    // } else {
    //     ROS_INFO_STREAM("call fail !");
    // }

    // 设置初始路径点
    ros::ServiceClient initWayPointsClient =
        nh.serviceClient<mav_offboard::IintWayPoints>(
            "/mav_offboard/set_init_way_points");
    mav_offboard::IintWayPoints srv2;
    geometry_msgs::PoseStamped firgrouptraPoints; //
    std::vector<geometry_msgs::PoseStamped> firgroup;
    geometry_msgs::PoseStamped secgrouptraPoints;
    std::vector<geometry_msgs::PoseStamped> secgroup;
    for (int i = 0; i <= 20; i += 20) {
        firgrouptraPoints.pose.position.x = i;
        firgrouptraPoints.pose.position.y = 0;
        firgrouptraPoints.pose.position.z = 2.5;
        firgrouptraPoints.pose.orientation = tf::createQuaternionMsgFromRollPitchYaw(0.0, 0.0, 0.0);
        firgroup.push_back(firgrouptraPoints);
    }

    for (int i = 0; i <= 20; i += 20) {
        secgrouptraPoints.pose.position.x = i;
        secgrouptraPoints.pose.position.y = 20;
        secgrouptraPoints.pose.position.z = 2.5;
        secgrouptraPoints.pose.orientation = tf::createQuaternionMsgFromRollPitchYaw(0.0, 0.0, 0.0);
        secgroup.push_back(secgrouptraPoints);
    }

    for (auto firiter = firgroup.begin(), seciter = secgroup.begin();
         firiter != firgroup.end() && seciter != secgroup.end();
         firiter++, seciter++) {
        srv2.request.initWayPoints.push_back(*firiter++);
        srv2.request.initWayPoints.push_back(*seciter++);
        srv2.request.initWayPoints.push_back(*seciter);
        srv2.request.initWayPoints.push_back(*firiter);
    }

    for (auto iter = srv2.request.initWayPoints.begin();
         iter != srv2.request.initWayPoints.end(); iter++) {
        ROS_INFO_STREAM("iter:" << *iter);
    }

    if (initWayPointsClient.call(srv2)) {
        ROS_INFO_STREAM("initWayPoints call success !");
    } else {
        ROS_INFO_STREAM("call fail !");
    }
    return 0;    

}
