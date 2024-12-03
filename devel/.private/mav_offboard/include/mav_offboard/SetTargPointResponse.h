// Generated by gencpp from file mav_offboard/SetTargPointResponse.msg
// DO NOT EDIT!


#ifndef MAV_OFFBOARD_MESSAGE_SETTARGPOINTRESPONSE_H
#define MAV_OFFBOARD_MESSAGE_SETTARGPOINTRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace mav_offboard
{
template <class ContainerAllocator>
struct SetTargPointResponse_
{
  typedef SetTargPointResponse_<ContainerAllocator> Type;

  SetTargPointResponse_()
    : success(false)  {
    }
  SetTargPointResponse_(const ContainerAllocator& _alloc)
    : success(false)  {
  (void)_alloc;
    }



   typedef uint8_t _success_type;
  _success_type success;





  typedef boost::shared_ptr< ::mav_offboard::SetTargPointResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mav_offboard::SetTargPointResponse_<ContainerAllocator> const> ConstPtr;

}; // struct SetTargPointResponse_

typedef ::mav_offboard::SetTargPointResponse_<std::allocator<void> > SetTargPointResponse;

typedef boost::shared_ptr< ::mav_offboard::SetTargPointResponse > SetTargPointResponsePtr;
typedef boost::shared_ptr< ::mav_offboard::SetTargPointResponse const> SetTargPointResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mav_offboard::SetTargPointResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mav_offboard::SetTargPointResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mav_offboard::SetTargPointResponse_<ContainerAllocator1> & lhs, const ::mav_offboard::SetTargPointResponse_<ContainerAllocator2> & rhs)
{
  return lhs.success == rhs.success;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mav_offboard::SetTargPointResponse_<ContainerAllocator1> & lhs, const ::mav_offboard::SetTargPointResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mav_offboard

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mav_offboard::SetTargPointResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mav_offboard::SetTargPointResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mav_offboard::SetTargPointResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mav_offboard::SetTargPointResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mav_offboard::SetTargPointResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mav_offboard::SetTargPointResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mav_offboard::SetTargPointResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "358e233cde0c8a8bcfea4ce193f8fc15";
  }

  static const char* value(const ::mav_offboard::SetTargPointResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x358e233cde0c8a8bULL;
  static const uint64_t static_value2 = 0xcfea4ce193f8fc15ULL;
};

template<class ContainerAllocator>
struct DataType< ::mav_offboard::SetTargPointResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mav_offboard/SetTargPointResponse";
  }

  static const char* value(const ::mav_offboard::SetTargPointResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mav_offboard::SetTargPointResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool success\n"
;
  }

  static const char* value(const ::mav_offboard::SetTargPointResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mav_offboard::SetTargPointResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.success);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetTargPointResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mav_offboard::SetTargPointResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mav_offboard::SetTargPointResponse_<ContainerAllocator>& v)
  {
    s << indent << "success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.success);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MAV_OFFBOARD_MESSAGE_SETTARGPOINTRESPONSE_H
