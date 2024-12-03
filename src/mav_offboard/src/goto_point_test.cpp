#include <ros/ros.h>
#include "mav_offboard/SetTargPoint.h"

int main(int argc, char *argv[])
{
    ros::init(argc, argv, "goto_point_test_client");
    ros::NodeHandle nh;
    ros::ServiceClient waypointsClient =
        nh.serviceClient<mav_offboard::SetTargPoint>(
            "/mav_offboard/set_targ_point");
    mav_offboard::SetTargPoint srv;
    srv.request.targPoint.pose.position.x = 3;
    srv.request.targPoint.pose.position.y = 5;
    srv.request.targPoint.pose.position.z = 5;

    srv.request.targPoint.pose.orientation.x = 0.0;
    srv.request.targPoint.pose.orientation.y = 0.0;
    srv.request.targPoint.pose.orientation.z = 0.0;
    // srv.request.targPoint.pose.orientation.w = 1.0;

    if (waypointsClient.call(srv)) {
        ROS_INFO_STREAM("call success !");
    } else {
        ROS_INFO_STREAM("call fail !");
    }
}
