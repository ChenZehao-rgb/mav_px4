# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "mav_offboard: 1 messages, 5 services")

set(MSG_I_FLAGS "-Imav_offboard:/home/chen/mav_px4/src/mav_offboard/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Imavros_msgs:/opt/ros/noetic/share/mavros_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeographic_msgs:/opt/ros/noetic/share/geographic_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Iuuid_msgs:/opt/ros/noetic/share/uuid_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(mav_offboard_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/msg/MavOffbCtlType.msg" NAME_WE)
add_custom_target(_mav_offboard_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_offboard" "/home/chen/mav_px4/src/mav_offboard/msg/MavOffbCtlType.msg" ""
)

get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/SetMavOffbCtlType.srv" NAME_WE)
add_custom_target(_mav_offboard_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_offboard" "/home/chen/mav_px4/src/mav_offboard/srv/SetMavOffbCtlType.srv" "mav_offboard/MavOffbCtlType"
)

get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/GenTrajOnline.srv" NAME_WE)
add_custom_target(_mav_offboard_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_offboard" "/home/chen/mav_px4/src/mav_offboard/srv/GenTrajOnline.srv" "geometry_msgs/Point:std_msgs/Header:geometry_msgs/Vector3:geometry_msgs/Quaternion:geometry_msgs/Twist:geometry_msgs/PoseStamped:geometry_msgs/TwistStamped:geometry_msgs/Pose:mavros_msgs/PositionTarget"
)

get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/SetTargPoint.srv" NAME_WE)
add_custom_target(_mav_offboard_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_offboard" "/home/chen/mav_px4/src/mav_offboard/srv/SetTargPoint.srv" "geometry_msgs/Point:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/PoseStamped:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/IintWayPoints.srv" NAME_WE)
add_custom_target(_mav_offboard_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_offboard" "/home/chen/mav_px4/src/mav_offboard/srv/IintWayPoints.srv" "geometry_msgs/Point:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/PoseStamped:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/UpdateBoundOnline.srv" NAME_WE)
add_custom_target(_mav_offboard_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_offboard" "/home/chen/mav_px4/src/mav_offboard/srv/UpdateBoundOnline.srv" "geometry_msgs/Vector3"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/msg/MavOffbCtlType.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_offboard
)

### Generating Services
_generate_srv_cpp(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/SetMavOffbCtlType.srv"
  "${MSG_I_FLAGS}"
  "/home/chen/mav_px4/src/mav_offboard/msg/MavOffbCtlType.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_offboard
)
_generate_srv_cpp(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/GenTrajOnline.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/mavros_msgs/cmake/../msg/PositionTarget.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_offboard
)
_generate_srv_cpp(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/SetTargPoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_offboard
)
_generate_srv_cpp(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/IintWayPoints.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_offboard
)
_generate_srv_cpp(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/UpdateBoundOnline.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_offboard
)

### Generating Module File
_generate_module_cpp(mav_offboard
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_offboard
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(mav_offboard_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(mav_offboard_generate_messages mav_offboard_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/msg/MavOffbCtlType.msg" NAME_WE)
add_dependencies(mav_offboard_generate_messages_cpp _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/SetMavOffbCtlType.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_cpp _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/GenTrajOnline.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_cpp _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/SetTargPoint.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_cpp _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/IintWayPoints.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_cpp _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/UpdateBoundOnline.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_cpp _mav_offboard_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mav_offboard_gencpp)
add_dependencies(mav_offboard_gencpp mav_offboard_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mav_offboard_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/msg/MavOffbCtlType.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_offboard
)

### Generating Services
_generate_srv_eus(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/SetMavOffbCtlType.srv"
  "${MSG_I_FLAGS}"
  "/home/chen/mav_px4/src/mav_offboard/msg/MavOffbCtlType.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_offboard
)
_generate_srv_eus(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/GenTrajOnline.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/mavros_msgs/cmake/../msg/PositionTarget.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_offboard
)
_generate_srv_eus(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/SetTargPoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_offboard
)
_generate_srv_eus(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/IintWayPoints.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_offboard
)
_generate_srv_eus(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/UpdateBoundOnline.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_offboard
)

### Generating Module File
_generate_module_eus(mav_offboard
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_offboard
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(mav_offboard_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(mav_offboard_generate_messages mav_offboard_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/msg/MavOffbCtlType.msg" NAME_WE)
add_dependencies(mav_offboard_generate_messages_eus _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/SetMavOffbCtlType.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_eus _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/GenTrajOnline.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_eus _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/SetTargPoint.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_eus _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/IintWayPoints.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_eus _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/UpdateBoundOnline.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_eus _mav_offboard_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mav_offboard_geneus)
add_dependencies(mav_offboard_geneus mav_offboard_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mav_offboard_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/msg/MavOffbCtlType.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_offboard
)

### Generating Services
_generate_srv_lisp(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/SetMavOffbCtlType.srv"
  "${MSG_I_FLAGS}"
  "/home/chen/mav_px4/src/mav_offboard/msg/MavOffbCtlType.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_offboard
)
_generate_srv_lisp(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/GenTrajOnline.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/mavros_msgs/cmake/../msg/PositionTarget.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_offboard
)
_generate_srv_lisp(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/SetTargPoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_offboard
)
_generate_srv_lisp(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/IintWayPoints.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_offboard
)
_generate_srv_lisp(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/UpdateBoundOnline.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_offboard
)

### Generating Module File
_generate_module_lisp(mav_offboard
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_offboard
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(mav_offboard_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(mav_offboard_generate_messages mav_offboard_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/msg/MavOffbCtlType.msg" NAME_WE)
add_dependencies(mav_offboard_generate_messages_lisp _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/SetMavOffbCtlType.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_lisp _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/GenTrajOnline.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_lisp _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/SetTargPoint.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_lisp _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/IintWayPoints.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_lisp _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/UpdateBoundOnline.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_lisp _mav_offboard_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mav_offboard_genlisp)
add_dependencies(mav_offboard_genlisp mav_offboard_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mav_offboard_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/msg/MavOffbCtlType.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_offboard
)

### Generating Services
_generate_srv_nodejs(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/SetMavOffbCtlType.srv"
  "${MSG_I_FLAGS}"
  "/home/chen/mav_px4/src/mav_offboard/msg/MavOffbCtlType.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_offboard
)
_generate_srv_nodejs(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/GenTrajOnline.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/mavros_msgs/cmake/../msg/PositionTarget.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_offboard
)
_generate_srv_nodejs(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/SetTargPoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_offboard
)
_generate_srv_nodejs(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/IintWayPoints.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_offboard
)
_generate_srv_nodejs(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/UpdateBoundOnline.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_offboard
)

### Generating Module File
_generate_module_nodejs(mav_offboard
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_offboard
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(mav_offboard_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(mav_offboard_generate_messages mav_offboard_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/msg/MavOffbCtlType.msg" NAME_WE)
add_dependencies(mav_offboard_generate_messages_nodejs _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/SetMavOffbCtlType.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_nodejs _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/GenTrajOnline.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_nodejs _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/SetTargPoint.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_nodejs _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/IintWayPoints.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_nodejs _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/UpdateBoundOnline.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_nodejs _mav_offboard_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mav_offboard_gennodejs)
add_dependencies(mav_offboard_gennodejs mav_offboard_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mav_offboard_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/msg/MavOffbCtlType.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_offboard
)

### Generating Services
_generate_srv_py(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/SetMavOffbCtlType.srv"
  "${MSG_I_FLAGS}"
  "/home/chen/mav_px4/src/mav_offboard/msg/MavOffbCtlType.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_offboard
)
_generate_srv_py(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/GenTrajOnline.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/mavros_msgs/cmake/../msg/PositionTarget.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_offboard
)
_generate_srv_py(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/SetTargPoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_offboard
)
_generate_srv_py(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/IintWayPoints.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_offboard
)
_generate_srv_py(mav_offboard
  "/home/chen/mav_px4/src/mav_offboard/srv/UpdateBoundOnline.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_offboard
)

### Generating Module File
_generate_module_py(mav_offboard
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_offboard
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(mav_offboard_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(mav_offboard_generate_messages mav_offboard_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/msg/MavOffbCtlType.msg" NAME_WE)
add_dependencies(mav_offboard_generate_messages_py _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/SetMavOffbCtlType.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_py _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/GenTrajOnline.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_py _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/SetTargPoint.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_py _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/IintWayPoints.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_py _mav_offboard_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/mav_px4/src/mav_offboard/srv/UpdateBoundOnline.srv" NAME_WE)
add_dependencies(mav_offboard_generate_messages_py _mav_offboard_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mav_offboard_genpy)
add_dependencies(mav_offboard_genpy mav_offboard_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mav_offboard_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_offboard)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_offboard
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(mav_offboard_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET mavros_msgs_generate_messages_cpp)
  add_dependencies(mav_offboard_generate_messages_cpp mavros_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(mav_offboard_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_offboard)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_offboard
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(mav_offboard_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET mavros_msgs_generate_messages_eus)
  add_dependencies(mav_offboard_generate_messages_eus mavros_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(mav_offboard_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_offboard)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_offboard
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(mav_offboard_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET mavros_msgs_generate_messages_lisp)
  add_dependencies(mav_offboard_generate_messages_lisp mavros_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(mav_offboard_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_offboard)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_offboard
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(mav_offboard_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET mavros_msgs_generate_messages_nodejs)
  add_dependencies(mav_offboard_generate_messages_nodejs mavros_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(mav_offboard_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_offboard)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_offboard\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_offboard
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(mav_offboard_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET mavros_msgs_generate_messages_py)
  add_dependencies(mav_offboard_generate_messages_py mavros_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(mav_offboard_generate_messages_py std_msgs_generate_messages_py)
endif()
