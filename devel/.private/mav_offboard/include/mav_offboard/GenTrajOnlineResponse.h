// Generated by gencpp from file mav_offboard/GenTrajOnlineResponse.msg
// DO NOT EDIT!


#ifndef MAV_OFFBOARD_MESSAGE_GENTRAJONLINERESPONSE_H
#define MAV_OFFBOARD_MESSAGE_GENTRAJONLINERESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <mavros_msgs/PositionTarget.h>

namespace mav_offboard
{
template <class ContainerAllocator>
struct GenTrajOnlineResponse_
{
  typedef GenTrajOnlineResponse_<ContainerAllocator> Type;

  GenTrajOnlineResponse_()
    : setPointRaw()
    , success(false)  {
    }
  GenTrajOnlineResponse_(const ContainerAllocator& _alloc)
    : setPointRaw(_alloc)
    , success(false)  {
  (void)_alloc;
    }



   typedef  ::mavros_msgs::PositionTarget_<ContainerAllocator>  _setPointRaw_type;
  _setPointRaw_type setPointRaw;

   typedef uint8_t _success_type;
  _success_type success;





  typedef boost::shared_ptr< ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator> const> ConstPtr;

}; // struct GenTrajOnlineResponse_

typedef ::mav_offboard::GenTrajOnlineResponse_<std::allocator<void> > GenTrajOnlineResponse;

typedef boost::shared_ptr< ::mav_offboard::GenTrajOnlineResponse > GenTrajOnlineResponsePtr;
typedef boost::shared_ptr< ::mav_offboard::GenTrajOnlineResponse const> GenTrajOnlineResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator1> & lhs, const ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator2> & rhs)
{
  return lhs.setPointRaw == rhs.setPointRaw &&
    lhs.success == rhs.success;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator1> & lhs, const ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mav_offboard

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "fc09c2e807f0520d98276cab75c5deb6";
  }

  static const char* value(const ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xfc09c2e807f0520dULL;
  static const uint64_t static_value2 = 0x98276cab75c5deb6ULL;
};

template<class ContainerAllocator>
struct DataType< ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mav_offboard/GenTrajOnlineResponse";
  }

  static const char* value(const ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mavros_msgs/PositionTarget setPointRaw\n"
"bool success\n"
"\n"
"================================================================================\n"
"MSG: mavros_msgs/PositionTarget\n"
"# Message for SET_POSITION_TARGET_LOCAL_NED\n"
"#\n"
"# Some complex system requires all feautures that mavlink\n"
"# message provide. See issue #402.\n"
"\n"
"std_msgs/Header header\n"
"\n"
"uint8 coordinate_frame\n"
"uint8 FRAME_LOCAL_NED = 1\n"
"uint8 FRAME_LOCAL_OFFSET_NED = 7\n"
"uint8 FRAME_BODY_NED = 8\n"
"uint8 FRAME_BODY_OFFSET_NED = 9\n"
"\n"
"uint16 type_mask\n"
"uint16 IGNORE_PX = 1	# Position ignore flags\n"
"uint16 IGNORE_PY = 2\n"
"uint16 IGNORE_PZ = 4\n"
"uint16 IGNORE_VX = 8	# Velocity vector ignore flags\n"
"uint16 IGNORE_VY = 16\n"
"uint16 IGNORE_VZ = 32\n"
"uint16 IGNORE_AFX = 64	# Acceleration/Force vector ignore flags\n"
"uint16 IGNORE_AFY = 128\n"
"uint16 IGNORE_AFZ = 256\n"
"uint16 FORCE = 512	# Force in af vector flag\n"
"uint16 IGNORE_YAW = 1024\n"
"uint16 IGNORE_YAW_RATE = 2048\n"
"\n"
"geometry_msgs/Point position\n"
"geometry_msgs/Vector3 velocity\n"
"geometry_msgs/Vector3 acceleration_or_force\n"
"float32 yaw\n"
"float32 yaw_rate\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3\n"
"# This represents a vector in free space. \n"
"# It is only meant to represent a direction. Therefore, it does not\n"
"# make sense to apply a translation to it (e.g., when applying a \n"
"# generic rigid transformation to a Vector3, tf2 will only apply the\n"
"# rotation). If you want your data to be translatable too, use the\n"
"# geometry_msgs/Point message instead.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.setPointRaw);
      stream.next(m.success);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GenTrajOnlineResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mav_offboard::GenTrajOnlineResponse_<ContainerAllocator>& v)
  {
    s << indent << "setPointRaw: ";
    s << std::endl;
    Printer< ::mavros_msgs::PositionTarget_<ContainerAllocator> >::stream(s, indent + "  ", v.setPointRaw);
    s << indent << "success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.success);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MAV_OFFBOARD_MESSAGE_GENTRAJONLINERESPONSE_H
