; Auto-generated. Do not edit!


(cl:in-package mav_offboard-srv)


;//! \htmlinclude SetTargPoint-request.msg.html

(cl:defclass <SetTargPoint-request> (roslisp-msg-protocol:ros-message)
  ((targPoint
    :reader targPoint
    :initarg :targPoint
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
)

(cl:defclass SetTargPoint-request (<SetTargPoint-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetTargPoint-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetTargPoint-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mav_offboard-srv:<SetTargPoint-request> is deprecated: use mav_offboard-srv:SetTargPoint-request instead.")))

(cl:ensure-generic-function 'targPoint-val :lambda-list '(m))
(cl:defmethod targPoint-val ((m <SetTargPoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_offboard-srv:targPoint-val is deprecated.  Use mav_offboard-srv:targPoint instead.")
  (targPoint m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetTargPoint-request>) ostream)
  "Serializes a message object of type '<SetTargPoint-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'targPoint) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetTargPoint-request>) istream)
  "Deserializes a message object of type '<SetTargPoint-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'targPoint) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetTargPoint-request>)))
  "Returns string type for a service object of type '<SetTargPoint-request>"
  "mav_offboard/SetTargPointRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetTargPoint-request)))
  "Returns string type for a service object of type 'SetTargPoint-request"
  "mav_offboard/SetTargPointRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetTargPoint-request>)))
  "Returns md5sum for a message object of type '<SetTargPoint-request>"
  "54e4e0134b6e5544072e07794fab0b97")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetTargPoint-request)))
  "Returns md5sum for a message object of type 'SetTargPoint-request"
  "54e4e0134b6e5544072e07794fab0b97")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetTargPoint-request>)))
  "Returns full string definition for message of type '<SetTargPoint-request>"
  (cl:format cl:nil "geometry_msgs/PoseStamped targPoint~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetTargPoint-request)))
  "Returns full string definition for message of type 'SetTargPoint-request"
  (cl:format cl:nil "geometry_msgs/PoseStamped targPoint~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetTargPoint-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'targPoint))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetTargPoint-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetTargPoint-request
    (cl:cons ':targPoint (targPoint msg))
))
;//! \htmlinclude SetTargPoint-response.msg.html

(cl:defclass <SetTargPoint-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetTargPoint-response (<SetTargPoint-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetTargPoint-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetTargPoint-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mav_offboard-srv:<SetTargPoint-response> is deprecated: use mav_offboard-srv:SetTargPoint-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetTargPoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_offboard-srv:success-val is deprecated.  Use mav_offboard-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetTargPoint-response>) ostream)
  "Serializes a message object of type '<SetTargPoint-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetTargPoint-response>) istream)
  "Deserializes a message object of type '<SetTargPoint-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetTargPoint-response>)))
  "Returns string type for a service object of type '<SetTargPoint-response>"
  "mav_offboard/SetTargPointResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetTargPoint-response)))
  "Returns string type for a service object of type 'SetTargPoint-response"
  "mav_offboard/SetTargPointResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetTargPoint-response>)))
  "Returns md5sum for a message object of type '<SetTargPoint-response>"
  "54e4e0134b6e5544072e07794fab0b97")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetTargPoint-response)))
  "Returns md5sum for a message object of type 'SetTargPoint-response"
  "54e4e0134b6e5544072e07794fab0b97")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetTargPoint-response>)))
  "Returns full string definition for message of type '<SetTargPoint-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetTargPoint-response)))
  "Returns full string definition for message of type 'SetTargPoint-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetTargPoint-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetTargPoint-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetTargPoint-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetTargPoint)))
  'SetTargPoint-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetTargPoint)))
  'SetTargPoint-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetTargPoint)))
  "Returns string type for a service object of type '<SetTargPoint>"
  "mav_offboard/SetTargPoint")