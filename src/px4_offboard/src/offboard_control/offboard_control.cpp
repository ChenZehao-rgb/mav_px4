// offboard控制代码
#include <ros/ros.h>
#include "offboard_control/offboard_control.h"

// 构造函数，初始化offboardControl类
OffboardControl::OffboardControl(ros::NodeHandle &nh)
{
    
}
int main(int argc, char *argv[])
{
    setlocale(LC_ALL,"");
    ros::init(argc, argv, "offboard_control_node");
    ros::Duration timeout(10.0);
    ROS_INFO_STREAM("offboard_control_node: start for wait \" mavros \" srv...");
    if (!ros::service::waitForService("mavros/cmd/arming", timeout)) {
        ROS_ERROR_STREAM(
            "offboard_control_node:  wait service \" /mavros/cmd/arming \" timeout");
        return 0;
    }

    if (!ros::service::waitForService("mavros/set_mode", timeout)) {
        ROS_ERROR_STREAM(
            "offboard_control_node:  wait service \" /mavros/set_mode \" timeout");
        return 0;
    }
    ROS_INFO_STREAM(" Get \" mavros \" srv");

    // wait for traj_generator srv
    if (!ros::service::waitForService("online_traj_generator/gen_traj_online",
                                        timeout)) {
        ROS_ERROR_STREAM(
            "offboard_control_node:  wait service "
            "\"/online_traj_generator/gen_traj_online\" timeout");
        return 0;
    }
    ROS_INFO_STREAM(" Get \" traj_generator \" srv");

    ros::NodeHandle nh;
    bool isSim;
    nh.param<bool>("offboard_control/is_sim", isSim, true);
    ros::AsyncSpinner spinner(3);
    spinner.start();
    // 传入节点句柄，使用构造函数初始化MavOffboard类
    OffboardControl offboardControl(nh);
    if (isSim) {
        offboardControl.setSim(isSim);
        
    }

    ROS_INFO_STREAM(
        "offboard_control_node: wait  \" mavros \" connenct with 5 sec...");

    offboardControl.run();

    return 0;
}