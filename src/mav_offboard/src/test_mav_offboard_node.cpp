#include <geometry_msgs/PoseStamped.h>
#include <mpl_basis/primitive.h>
#include <mpl_traj_solver/traj_solver.h>
#include <ros/ros.h>
#include <tf/tf.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include "mav_offboard/IintWayPoints.h"

int main(int argc, char *argv[]) {
  ros::init(argc, argv, "test_client");
  ros::NodeHandle nh;
  ros::ServiceClient waypointsClient =
      nh.serviceClient<mav_offboard::IintWayPoints>(
          "/mav_offboard/set_init_way_points");
  mav_offboard::IintWayPoints srv;
  // srv.request.initWayPoints;
  geometry_msgs::PoseStamped firgrouptraPoints;
  std::vector<geometry_msgs::PoseStamped> firgroup;
  geometry_msgs::PoseStamped secgrouptraPoints;
  std::vector<geometry_msgs::PoseStamped> secgroup;
  geometry_msgs::PoseStamped lastfirgrouptraPoint;
  geometry_msgs::PoseStamped lastsecgrouptraPoint;
  geometry_msgs::PoseStamped lastthrgrouptraPoint;
  // std::cout << "press \"Enter\" key to continue..." << std::endl;
  // getchar();
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
    srv.request.initWayPoints.push_back(*firiter++);
    srv.request.initWayPoints.push_back(*seciter++);
    srv.request.initWayPoints.push_back(*seciter);
    srv.request.initWayPoints.push_back(*firiter);
  }
  // lastsecgrouptraPoint.pose.position.x = 0;
  // lastsecgrouptraPoint.pose.position.y = 5;
  // lastsecgrouptraPoint.pose.position.z = 10;
  // lastfirgrouptraPoint.pose.position.x = 2;
  // lastfirgrouptraPoint.pose.position.y = 5;
  // lastfirgrouptraPoint.pose.position.z = 10;

  // lastthrgrouptraPoint.pose.position.x = 2;
  // lastthrgrouptraPoint.pose.position.y = 0;
  // lastthrgrouptraPoint.pose.position.z = 10;

  // srv.request.initWayPoints.push_back(lastsecgrouptraPoint);
  // srv.request.initWayPoints.push_back(lastfirgrouptraPoint);
  // srv.request.initWayPoints.push_back(lastthrgrouptraPoint);

  for (auto iter = srv.request.initWayPoints.begin();
       iter != srv.request.initWayPoints.end();iter++) {
    ROS_INFO_STREAM("iter:"<<*iter);
  }

  if (waypointsClient.call(srv)) {
    ROS_INFO_STREAM("call success !");
  } else {
    ROS_INFO_STREAM("call fail !");
  }
}