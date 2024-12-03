;; Auto-generated. Do not edit!


(when (boundp 'mav_offboard::SetTargPoint)
  (if (not (find-package "MAV_OFFBOARD"))
    (make-package "MAV_OFFBOARD"))
  (shadow 'SetTargPoint (find-package "MAV_OFFBOARD")))
(unless (find-package "MAV_OFFBOARD::SETTARGPOINT")
  (make-package "MAV_OFFBOARD::SETTARGPOINT"))
(unless (find-package "MAV_OFFBOARD::SETTARGPOINTREQUEST")
  (make-package "MAV_OFFBOARD::SETTARGPOINTREQUEST"))
(unless (find-package "MAV_OFFBOARD::SETTARGPOINTRESPONSE")
  (make-package "MAV_OFFBOARD::SETTARGPOINTRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass mav_offboard::SetTargPointRequest
  :super ros::object
  :slots (_targPoint ))

(defmethod mav_offboard::SetTargPointRequest
  (:init
   (&key
    ((:targPoint __targPoint) (instance geometry_msgs::PoseStamped :init))
    )
   (send-super :init)
   (setq _targPoint __targPoint)
   self)
  (:targPoint
   (&rest __targPoint)
   (if (keywordp (car __targPoint))
       (send* _targPoint __targPoint)
     (progn
       (if __targPoint (setq _targPoint (car __targPoint)))
       _targPoint)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/PoseStamped _targPoint
    (send _targPoint :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/PoseStamped _targPoint
       (send _targPoint :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/PoseStamped _targPoint
     (send _targPoint :deserialize buf ptr-) (incf ptr- (send _targPoint :serialization-length))
   ;;
   self)
  )

(defclass mav_offboard::SetTargPointResponse
  :super ros::object
  :slots (_success ))

(defmethod mav_offboard::SetTargPointResponse
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

(defclass mav_offboard::SetTargPoint
  :super ros::object
  :slots ())

(setf (get mav_offboard::SetTargPoint :md5sum-) "54e4e0134b6e5544072e07794fab0b97")
(setf (get mav_offboard::SetTargPoint :datatype-) "mav_offboard/SetTargPoint")
(setf (get mav_offboard::SetTargPoint :request) mav_offboard::SetTargPointRequest)
(setf (get mav_offboard::SetTargPoint :response) mav_offboard::SetTargPointResponse)

(defmethod mav_offboard::SetTargPointRequest
  (:response () (instance mav_offboard::SetTargPointResponse :init)))

(setf (get mav_offboard::SetTargPointRequest :md5sum-) "54e4e0134b6e5544072e07794fab0b97")
(setf (get mav_offboard::SetTargPointRequest :datatype-) "mav_offboard/SetTargPointRequest")
(setf (get mav_offboard::SetTargPointRequest :definition-)
      "geometry_msgs/PoseStamped targPoint

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

(setf (get mav_offboard::SetTargPointResponse :md5sum-) "54e4e0134b6e5544072e07794fab0b97")
(setf (get mav_offboard::SetTargPointResponse :datatype-) "mav_offboard/SetTargPointResponse")
(setf (get mav_offboard::SetTargPointResponse :definition-)
      "geometry_msgs/PoseStamped targPoint

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



(provide :mav_offboard/SetTargPoint "54e4e0134b6e5544072e07794fab0b97")


