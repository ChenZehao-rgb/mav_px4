// Generated by gencpp from file mav_offboard/IintWayPoints.msg
// DO NOT EDIT!


#ifndef MAV_OFFBOARD_MESSAGE_IINTWAYPOINTS_H
#define MAV_OFFBOARD_MESSAGE_IINTWAYPOINTS_H

#include <ros/service_traits.h>


#include <mav_offboard/IintWayPointsRequest.h>
#include <mav_offboard/IintWayPointsResponse.h>


namespace mav_offboard
{

struct IintWayPoints
{

typedef IintWayPointsRequest Request;
typedef IintWayPointsResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct IintWayPoints
} // namespace mav_offboard


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::mav_offboard::IintWayPoints > {
  static const char* value()
  {
    return "523c538c9af8991ed03dd1d0d560dde0";
  }

  static const char* value(const ::mav_offboard::IintWayPoints&) { return value(); }
};

template<>
struct DataType< ::mav_offboard::IintWayPoints > {
  static const char* value()
  {
    return "mav_offboard/IintWayPoints";
  }

  static const char* value(const ::mav_offboard::IintWayPoints&) { return value(); }
};


// service_traits::MD5Sum< ::mav_offboard::IintWayPointsRequest> should match
// service_traits::MD5Sum< ::mav_offboard::IintWayPoints >
template<>
struct MD5Sum< ::mav_offboard::IintWayPointsRequest>
{
  static const char* value()
  {
    return MD5Sum< ::mav_offboard::IintWayPoints >::value();
  }
  static const char* value(const ::mav_offboard::IintWayPointsRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::mav_offboard::IintWayPointsRequest> should match
// service_traits::DataType< ::mav_offboard::IintWayPoints >
template<>
struct DataType< ::mav_offboard::IintWayPointsRequest>
{
  static const char* value()
  {
    return DataType< ::mav_offboard::IintWayPoints >::value();
  }
  static const char* value(const ::mav_offboard::IintWayPointsRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::mav_offboard::IintWayPointsResponse> should match
// service_traits::MD5Sum< ::mav_offboard::IintWayPoints >
template<>
struct MD5Sum< ::mav_offboard::IintWayPointsResponse>
{
  static const char* value()
  {
    return MD5Sum< ::mav_offboard::IintWayPoints >::value();
  }
  static const char* value(const ::mav_offboard::IintWayPointsResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::mav_offboard::IintWayPointsResponse> should match
// service_traits::DataType< ::mav_offboard::IintWayPoints >
template<>
struct DataType< ::mav_offboard::IintWayPointsResponse>
{
  static const char* value()
  {
    return DataType< ::mav_offboard::IintWayPoints >::value();
  }
  static const char* value(const ::mav_offboard::IintWayPointsResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MAV_OFFBOARD_MESSAGE_IINTWAYPOINTS_H
