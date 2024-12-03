; Auto-generated. Do not edit!


(cl:in-package mav_offboard-srv)


;//! \htmlinclude IintWayPoints-request.msg.html

(cl:defclass <IintWayPoints-request> (roslisp-msg-protocol:ros-message)
  ((initWayPoints
    :reader initWayPoints
    :initarg :initWayPoints
    :type (cl:vector geometry_msgs-msg:PoseStamped)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:PoseStamped :initial-element (cl:make-instance 'geometry_msgs-msg:PoseStamped))))
)

(cl:defclass IintWayPoints-request (<IintWayPoints-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IintWayPoints-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IintWayPoints-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mav_offboard-srv:<IintWayPoints-request> is deprecated: use mav_offboard-srv:IintWayPoints-request instead.")))

(cl:ensure-generic-function 'initWayPoints-val :lambda-list '(m))
(cl:defmethod initWayPoints-val ((m <IintWayPoints-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_offboard-srv:initWayPoints-val is deprecated.  Use mav_offboard-srv:initWayPoints instead.")
  (initWayPoints m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IintWayPoints-request>) ostream)
  "Serializes a message object of type '<IintWayPoints-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'initWayPoints))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'initWayPoints))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IintWayPoints-request>) istream)
  "Deserializes a message object of type '<IintWayPoints-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'initWayPoints) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'initWayPoints)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:PoseStamped))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IintWayPoints-request>)))
  "Returns string type for a service object of type '<IintWayPoints-request>"
  "mav_offboard/IintWayPointsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IintWayPoints-request)))
  "Returns string type for a service object of type 'IintWayPoints-request"
  "mav_offboard/IintWayPointsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IintWayPoints-request>)))
  "Returns md5sum for a message object of type '<IintWayPoints-request>"
  "523c538c9af8991ed03dd1d0d560dde0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IintWayPoints-request)))
  "Returns md5sum for a message object of type 'IintWayPoints-request"
  "523c538c9af8991ed03dd1d0d560dde0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IintWayPoints-request>)))
  "Returns full string definition for message of type '<IintWayPoints-request>"
  (cl:format cl:nil "geometry_msgs/PoseStamped[] initWayPoints~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IintWayPoints-request)))
  "Returns full string definition for message of type 'IintWayPoints-request"
  (cl:format cl:nil "geometry_msgs/PoseStamped[] initWayPoints~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IintWayPoints-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'initWayPoints) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IintWayPoints-request>))
  "Converts a ROS message object to a list"
  (cl:list 'IintWayPoints-request
    (cl:cons ':initWayPoints (initWayPoints msg))
))
;//! \htmlinclude IintWayPoints-response.msg.html

(cl:defclass <IintWayPoints-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass IintWayPoints-response (<IintWayPoints-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IintWayPoints-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IintWayPoints-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mav_offboard-srv:<IintWayPoints-response> is deprecated: use mav_offboard-srv:IintWayPoints-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <IintWayPoints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_offboard-srv:success-val is deprecated.  Use mav_offboard-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IintWayPoints-response>) ostream)
  "Serializes a message object of type '<IintWayPoints-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IintWayPoints-response>) istream)
  "Deserializes a message object of type '<IintWayPoints-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IintWayPoints-response>)))
  "Returns string type for a service object of type '<IintWayPoints-response>"
  "mav_offboard/IintWayPointsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IintWayPoints-response)))
  "Returns string type for a service object of type 'IintWayPoints-response"
  "mav_offboard/IintWayPointsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IintWayPoints-response>)))
  "Returns md5sum for a message object of type '<IintWayPoints-response>"
  "523c538c9af8991ed03dd1d0d560dde0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IintWayPoints-response)))
  "Returns md5sum for a message object of type 'IintWayPoints-response"
  "523c538c9af8991ed03dd1d0d560dde0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IintWayPoints-response>)))
  "Returns full string definition for message of type '<IintWayPoints-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IintWayPoints-response)))
  "Returns full string definition for message of type 'IintWayPoints-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IintWayPoints-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IintWayPoints-response>))
  "Converts a ROS message object to a list"
  (cl:list 'IintWayPoints-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'IintWayPoints)))
  'IintWayPoints-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'IintWayPoints)))
  'IintWayPoints-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IintWayPoints)))
  "Returns string type for a service object of type '<IintWayPoints>"
  "mav_offboard/IintWayPoints")