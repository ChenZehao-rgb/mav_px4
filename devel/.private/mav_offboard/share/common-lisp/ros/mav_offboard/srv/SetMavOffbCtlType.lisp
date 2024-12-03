; Auto-generated. Do not edit!


(cl:in-package mav_offboard-srv)


;//! \htmlinclude SetMavOffbCtlType-request.msg.html

(cl:defclass <SetMavOffbCtlType-request> (roslisp-msg-protocol:ros-message)
  ((ctlType
    :reader ctlType
    :initarg :ctlType
    :type mav_offboard-msg:MavOffbCtlType
    :initform (cl:make-instance 'mav_offboard-msg:MavOffbCtlType)))
)

(cl:defclass SetMavOffbCtlType-request (<SetMavOffbCtlType-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetMavOffbCtlType-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetMavOffbCtlType-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mav_offboard-srv:<SetMavOffbCtlType-request> is deprecated: use mav_offboard-srv:SetMavOffbCtlType-request instead.")))

(cl:ensure-generic-function 'ctlType-val :lambda-list '(m))
(cl:defmethod ctlType-val ((m <SetMavOffbCtlType-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_offboard-srv:ctlType-val is deprecated.  Use mav_offboard-srv:ctlType instead.")
  (ctlType m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetMavOffbCtlType-request>) ostream)
  "Serializes a message object of type '<SetMavOffbCtlType-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ctlType) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetMavOffbCtlType-request>) istream)
  "Deserializes a message object of type '<SetMavOffbCtlType-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ctlType) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetMavOffbCtlType-request>)))
  "Returns string type for a service object of type '<SetMavOffbCtlType-request>"
  "mav_offboard/SetMavOffbCtlTypeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMavOffbCtlType-request)))
  "Returns string type for a service object of type 'SetMavOffbCtlType-request"
  "mav_offboard/SetMavOffbCtlTypeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetMavOffbCtlType-request>)))
  "Returns md5sum for a message object of type '<SetMavOffbCtlType-request>"
  "ba3bb96f001193382c990776aa0640ca")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetMavOffbCtlType-request)))
  "Returns md5sum for a message object of type 'SetMavOffbCtlType-request"
  "ba3bb96f001193382c990776aa0640ca")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetMavOffbCtlType-request>)))
  "Returns full string definition for message of type '<SetMavOffbCtlType-request>"
  (cl:format cl:nil "mav_offboard/MavOffbCtlType ctlType~%~%================================================================================~%MSG: mav_offboard/MavOffbCtlType~%~%# mav offb control type for diff tasks~%uint8 mav_offb_ctl_type~%~%uint8 OFFBOARD_IGNORE = 0~%~%uint8 GOTO_SETPOINT_STEP = 1~%uint8 GOTO_SETPOINT_SMOOTH = 2~%~%uint8 GOTO_SETPOINTS_STEP = 3~%uint8 GOTO_SETPOINTS_SMOOTH = 4~%~%uint8 POS_CTRL_BY_ATT = 5~%~%uint8 POS_CTRL_BY_BODY_RATE = 6~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetMavOffbCtlType-request)))
  "Returns full string definition for message of type 'SetMavOffbCtlType-request"
  (cl:format cl:nil "mav_offboard/MavOffbCtlType ctlType~%~%================================================================================~%MSG: mav_offboard/MavOffbCtlType~%~%# mav offb control type for diff tasks~%uint8 mav_offb_ctl_type~%~%uint8 OFFBOARD_IGNORE = 0~%~%uint8 GOTO_SETPOINT_STEP = 1~%uint8 GOTO_SETPOINT_SMOOTH = 2~%~%uint8 GOTO_SETPOINTS_STEP = 3~%uint8 GOTO_SETPOINTS_SMOOTH = 4~%~%uint8 POS_CTRL_BY_ATT = 5~%~%uint8 POS_CTRL_BY_BODY_RATE = 6~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetMavOffbCtlType-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ctlType))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetMavOffbCtlType-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetMavOffbCtlType-request
    (cl:cons ':ctlType (ctlType msg))
))
;//! \htmlinclude SetMavOffbCtlType-response.msg.html

(cl:defclass <SetMavOffbCtlType-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetMavOffbCtlType-response (<SetMavOffbCtlType-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetMavOffbCtlType-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetMavOffbCtlType-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mav_offboard-srv:<SetMavOffbCtlType-response> is deprecated: use mav_offboard-srv:SetMavOffbCtlType-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetMavOffbCtlType-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_offboard-srv:success-val is deprecated.  Use mav_offboard-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetMavOffbCtlType-response>) ostream)
  "Serializes a message object of type '<SetMavOffbCtlType-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetMavOffbCtlType-response>) istream)
  "Deserializes a message object of type '<SetMavOffbCtlType-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetMavOffbCtlType-response>)))
  "Returns string type for a service object of type '<SetMavOffbCtlType-response>"
  "mav_offboard/SetMavOffbCtlTypeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMavOffbCtlType-response)))
  "Returns string type for a service object of type 'SetMavOffbCtlType-response"
  "mav_offboard/SetMavOffbCtlTypeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetMavOffbCtlType-response>)))
  "Returns md5sum for a message object of type '<SetMavOffbCtlType-response>"
  "ba3bb96f001193382c990776aa0640ca")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetMavOffbCtlType-response)))
  "Returns md5sum for a message object of type 'SetMavOffbCtlType-response"
  "ba3bb96f001193382c990776aa0640ca")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetMavOffbCtlType-response>)))
  "Returns full string definition for message of type '<SetMavOffbCtlType-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetMavOffbCtlType-response)))
  "Returns full string definition for message of type 'SetMavOffbCtlType-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetMavOffbCtlType-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetMavOffbCtlType-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetMavOffbCtlType-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetMavOffbCtlType)))
  'SetMavOffbCtlType-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetMavOffbCtlType)))
  'SetMavOffbCtlType-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMavOffbCtlType)))
  "Returns string type for a service object of type '<SetMavOffbCtlType>"
  "mav_offboard/SetMavOffbCtlType")