#include <ros/ros.h>
#include <traj_generator/online_traj_generator.h>


int main(int argc, char *argv[]) {
  ros::init(argc, argv, "online_traj_generator");
  ros::NodeHandle nh;
  ros::AsyncSpinner spinner(2);
  spinner.start();
  OnlineTrajGenerator onlineTrajGen(nh);
  while (ros::ok()) {
    ros::Duration(1.0).sleep();
  }
  return 0;
}
