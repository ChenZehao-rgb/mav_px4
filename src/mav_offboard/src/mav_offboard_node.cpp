#include "ros/ros.h"
#include "mav_offboard/mav_offboard.h"

int main(int argc, char *argv[])
{
    setlocale(LC_ALL,"");
    ros::init(argc, argv, "mav_offboard_node");
    ros::Duration timeout(10.0);
    ROS_INFO_STREAM("mav_offboard_node: start for wait \" mavros \" srv...");
    if (!ros::service::waitForService("mavros/cmd/arming", timeout)) {
        ROS_ERROR_STREAM(
            "mav_offboard_onde:  wait service \" /mavros/cmd/arming \" timeout");
        return 0;
    }

    if (!ros::service::waitForService("mavros/set_mode", timeout)) {
        ROS_ERROR_STREAM(
            "mav_offboard_onde:  wait service \" /mavros/set_mode \" timeout");
        return 0;
    }
    ROS_INFO_STREAM(" Get \" mavros \" srv");

    // wait for traj_generator srv
    if (!ros::service::waitForService("online_traj_generator/gen_traj_online",
                                        timeout)) {
        ROS_ERROR_STREAM(
            "mav_offboard_onde:  wait service "
            "\"/online_traj_generator/gen_traj_online\" timeout");
        return 0;
    }
    ROS_INFO_STREAM(" Get \" traj_generator \" srv");

    ros::NodeHandle nh;
    bool isSim;
    nh.param<bool>("mav_offboard/is_sim", isSim, true);

    ros::AsyncSpinner spinner(3);
    spinner.start();
    MavOffboard mavOffboard(nh);
    if (isSim) {
        mavOffboard.setSim(isSim);
    }

    ROS_INFO_STREAM(
        "mav_offboard_onde: wait  \" mavros \" connenct with 5 sec...");

    mavOffboard.run();

    return 0;
}
