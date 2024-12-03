; Auto-generated. Do not edit!


(cl:in-package mav_offboard-msg)


;//! \htmlinclude MavOffbCtlType.msg.html

(cl:defclass <MavOffbCtlType> (roslisp-msg-protocol:ros-message)
  ((mav_offb_ctl_type
    :reader mav_offb_ctl_type
    :initarg :mav_offb_ctl_type
    :type cl:fixnum
    :initform 0))
)

(cl:defclass MavOffbCtlType (<MavOffbCtlType>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MavOffbCtlType>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MavOffbCtlType)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mav_offboard-msg:<MavOffbCtlType> is deprecated: use mav_offboard-msg:MavOffbCtlType instead.")))

(cl:ensure-generic-function 'mav_offb_ctl_type-val :lambda-list '(m))
(cl:defmethod mav_offb_ctl_type-val ((m <MavOffbCtlType>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_offboard-msg:mav_offb_ctl_type-val is deprecated.  Use mav_offboard-msg:mav_offb_ctl_type instead.")
  (mav_offb_ctl_type m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<MavOffbCtlType>)))
    "Constants for message type '<MavOffbCtlType>"
  '((:OFFBOARD_IGNORE . 0)
    (:GOTO_SETPOINT_STEP . 1)
    (:GOTO_SETPOINT_SMOOTH . 2)
    (:GOTO_SETPOINTS_STEP . 3)
    (:GOTO_SETPOINTS_SMOOTH . 4)
    (:POS_CTRL_BY_ATT . 5)
    (:POS_CTRL_BY_BODY_RATE . 6))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'MavOffbCtlType)))
    "Constants for message type 'MavOffbCtlType"
  '((:OFFBOARD_IGNORE . 0)
    (:GOTO_SETPOINT_STEP . 1)
    (:GOTO_SETPOINT_SMOOTH . 2)
    (:GOTO_SETPOINTS_STEP . 3)
    (:GOTO_SETPOINTS_SMOOTH . 4)
    (:POS_CTRL_BY_ATT . 5)
    (:POS_CTRL_BY_BODY_RATE . 6))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MavOffbCtlType>) ostream)
  "Serializes a message object of type '<MavOffbCtlType>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mav_offb_ctl_type)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MavOffbCtlType>) istream)
  "Deserializes a message object of type '<MavOffbCtlType>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mav_offb_ctl_type)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MavOffbCtlType>)))
  "Returns string type for a message object of type '<MavOffbCtlType>"
  "mav_offboard/MavOffbCtlType")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MavOffbCtlType)))
  "Returns string type for a message object of type 'MavOffbCtlType"
  "mav_offboard/MavOffbCtlType")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MavOffbCtlType>)))
  "Returns md5sum for a message object of type '<MavOffbCtlType>"
  "ecfa29034218f9eaa269cda4f3eba64a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MavOffbCtlType)))
  "Returns md5sum for a message object of type 'MavOffbCtlType"
  "ecfa29034218f9eaa269cda4f3eba64a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MavOffbCtlType>)))
  "Returns full string definition for message of type '<MavOffbCtlType>"
  (cl:format cl:nil "~%# mav offb control type for diff tasks~%uint8 mav_offb_ctl_type~%~%uint8 OFFBOARD_IGNORE = 0~%~%uint8 GOTO_SETPOINT_STEP = 1~%uint8 GOTO_SETPOINT_SMOOTH = 2~%~%uint8 GOTO_SETPOINTS_STEP = 3~%uint8 GOTO_SETPOINTS_SMOOTH = 4~%~%uint8 POS_CTRL_BY_ATT = 5~%~%uint8 POS_CTRL_BY_BODY_RATE = 6~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MavOffbCtlType)))
  "Returns full string definition for message of type 'MavOffbCtlType"
  (cl:format cl:nil "~%# mav offb control type for diff tasks~%uint8 mav_offb_ctl_type~%~%uint8 OFFBOARD_IGNORE = 0~%~%uint8 GOTO_SETPOINT_STEP = 1~%uint8 GOTO_SETPOINT_SMOOTH = 2~%~%uint8 GOTO_SETPOINTS_STEP = 3~%uint8 GOTO_SETPOINTS_SMOOTH = 4~%~%uint8 POS_CTRL_BY_ATT = 5~%~%uint8 POS_CTRL_BY_BODY_RATE = 6~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MavOffbCtlType>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MavOffbCtlType>))
  "Converts a ROS message object to a list"
  (cl:list 'MavOffbCtlType
    (cl:cons ':mav_offb_ctl_type (mav_offb_ctl_type msg))
))
