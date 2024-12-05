#ifndef OFFBOARD_CONTROL_H
#define OFFBOARD_CONTROL_H

#include "mav_offboard/mav_offboard.h"

class OffboardControl : public Mavoffboard {
public:
    OffboardControl(const ros::NodeHandle &nh);
    ~OffboardControl();

    // Add your member functions and variables here
private:
    // Add your private member functions and variables here
    ros::NodeHandle nh_;
    ros::Subscriber uavPoseLocalSub_; // 订阅者，订阅无人机的本地位置
    ros::Subscriber uavTwistLocalSub_; // 订阅者，订阅无人机的本地速度
};

#endif // OFFBOARD_CONTROL_H