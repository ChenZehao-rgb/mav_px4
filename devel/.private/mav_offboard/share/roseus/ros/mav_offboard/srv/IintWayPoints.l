;; Auto-generated. Do not edit!


(when (boundp 'mav_offboard::IintWayPoints)
  (if (not (find-package "MAV_OFFBOARD"))
    (make-package "MAV_OFFBOARD"))
  (shadow 'IintWayPoints (find-package "MAV_OFFBOARD")))
(unless (find-package "MAV_OFFBOARD::IINTWAYPOINTS")
  (make-package "MAV_OFFBOARD::IINTWAYPOINTS"))
(unless (find-package "MAV_OFFBOARD::IINTWAYPOINTSREQUEST")
  (make-package "MAV_OFFBOARD::IINTWAYPOINTSREQUEST"))
(unless (find-package "MAV_OFFBOARD::IINTWAYPOINTSRESPONSE")
  (make-package "MAV_OFFBOARD::IINTWAYPOINTSRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass mav_offboard::IintWayPointsRequest
  :super ros::object
  :slots (_initWayPoints ))

(defmethod mav_offboard::IintWayPointsRequest
  (:init
   (&key
    ((:initWayPoints __initWayPoints) ())
    )
   (send-super :init)
   (setq _initWayPoints __initWayPoints)
   self)
  (:initWayPoints
   (&rest __initWayPoints)
   (if (keywordp (car __initWayPoints))
       (send* _initWayPoints __initWayPoints)
     (progn
       (if __initWayPoints (setq _initWayPoints (car __initWayPoints)))
       _initWayPoints)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/PoseStamped[] _initWayPoints
    (apply #'+ (send-all _initWayPoints :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/PoseStamped[] _initWayPoints
     (write-long (length _initWayPoints) s)
     (dolist (elem _initWayPoints)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/PoseStamped[] _initWayPoints
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _initWayPoints (let (r) (dotimes (i n) (push (instance geometry_msgs::PoseStamped :init) r)) r))
     (dolist (elem- _initWayPoints)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass mav_offboard::IintWayPointsResponse
  :super ros::object
  :slots (_success ))

(defmethod mav_offboard::IintWayPointsResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass mav_offboard::IintWayPoints
  :super ros::object
  :slots ())

(setf (get mav_offboard::IintWayPoints :md5sum-) "523c538c9af8991ed03dd1d0d560dde0")
(setf (get mav_offboard::IintWayPoints :datatype-) "mav_offboard/IintWayPoints")
(setf (get mav_offboard::IintWayPoints :request) mav_offboard::IintWayPointsRequest)
(setf (get mav_offboard::IintWayPoints :response) mav_offboard::IintWayPointsResponse)

(defmethod mav_offboard::IintWayPointsRequest
  (:response () (instance mav_offboard::IintWayPointsResponse :init)))

(setf (get mav_offboard::IintWayPointsRequest :md5sum-) "523c538c9af8991ed03dd1d0d560dde0")
(setf (get mav_offboard::IintWayPointsRequest :datatype-) "mav_offboard/IintWayPointsRequest")
(setf (get mav_offboard::IintWayPointsRequest :definition-)
      "geometry_msgs/PoseStamped[] initWayPoints

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
bool success
")

(setf (get mav_offboard::IintWayPointsResponse :md5sum-) "523c538c9af8991ed03dd1d0d560dde0")
(setf (get mav_offboard::IintWayPointsResponse :datatype-) "mav_offboard/IintWayPointsResponse")
(setf (get mav_offboard::IintWayPointsResponse :definition-)
      "geometry_msgs/PoseStamped[] initWayPoints

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
bool success
")



(provide :mav_offboard/IintWayPoints "523c538c9af8991ed03dd1d0d560dde0")


