;; Auto-generated. Do not edit!


(when (boundp 'mav_offboard::UpdateBoundOnline)
  (if (not (find-package "MAV_OFFBOARD"))
    (make-package "MAV_OFFBOARD"))
  (shadow 'UpdateBoundOnline (find-package "MAV_OFFBOARD")))
(unless (find-package "MAV_OFFBOARD::UPDATEBOUNDONLINE")
  (make-package "MAV_OFFBOARD::UPDATEBOUNDONLINE"))
(unless (find-package "MAV_OFFBOARD::UPDATEBOUNDONLINEREQUEST")
  (make-package "MAV_OFFBOARD::UPDATEBOUNDONLINEREQUEST"))
(unless (find-package "MAV_OFFBOARD::UPDATEBOUNDONLINERESPONSE")
  (make-package "MAV_OFFBOARD::UPDATEBOUNDONLINERESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass mav_offboard::UpdateBoundOnlineRequest
  :super ros::object
  :slots (_velBound _accBound ))

(defmethod mav_offboard::UpdateBoundOnlineRequest
  (:init
   (&key
    ((:velBound __velBound) (instance geometry_msgs::Vector3 :init))
    ((:accBound __accBound) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _velBound __velBound)
   (setq _accBound __accBound)
   self)
  (:velBound
   (&rest __velBound)
   (if (keywordp (car __velBound))
       (send* _velBound __velBound)
     (progn
       (if __velBound (setq _velBound (car __velBound)))
       _velBound)))
  (:accBound
   (&rest __accBound)
   (if (keywordp (car __accBound))
       (send* _accBound __accBound)
     (progn
       (if __accBound (setq _accBound (car __accBound)))
       _accBound)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Vector3 _velBound
    (send _velBound :serialization-length)
    ;; geometry_msgs/Vector3 _accBound
    (send _accBound :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Vector3 _velBound
       (send _velBound :serialize s)
     ;; geometry_msgs/Vector3 _accBound
       (send _accBound :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Vector3 _velBound
     (send _velBound :deserialize buf ptr-) (incf ptr- (send _velBound :serialization-length))
   ;; geometry_msgs/Vector3 _accBound
     (send _accBound :deserialize buf ptr-) (incf ptr- (send _accBound :serialization-length))
   ;;
   self)
  )

(defclass mav_offboard::UpdateBoundOnlineResponse
  :super ros::object
  :slots (_success _isBoundUpdate ))

(defmethod mav_offboard::UpdateBoundOnlineResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:isBoundUpdate __isBoundUpdate) nil)
    )
   (send-super :init)
   (setq _success __success)
   (setq _isBoundUpdate __isBoundUpdate)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:isBoundUpdate
   (&optional (__isBoundUpdate :null))
   (if (not (eq __isBoundUpdate :null)) (setq _isBoundUpdate __isBoundUpdate)) _isBoundUpdate)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; bool _isBoundUpdate
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; bool _isBoundUpdate
       (if _isBoundUpdate (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _isBoundUpdate
     (setq _isBoundUpdate (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass mav_offboard::UpdateBoundOnline
  :super ros::object
  :slots ())

(setf (get mav_offboard::UpdateBoundOnline :md5sum-) "b63d0873a52c6e04efd40342ee8fed38")
(setf (get mav_offboard::UpdateBoundOnline :datatype-) "mav_offboard/UpdateBoundOnline")
(setf (get mav_offboard::UpdateBoundOnline :request) mav_offboard::UpdateBoundOnlineRequest)
(setf (get mav_offboard::UpdateBoundOnline :response) mav_offboard::UpdateBoundOnlineResponse)

(defmethod mav_offboard::UpdateBoundOnlineRequest
  (:response () (instance mav_offboard::UpdateBoundOnlineResponse :init)))

(setf (get mav_offboard::UpdateBoundOnlineRequest :md5sum-) "b63d0873a52c6e04efd40342ee8fed38")
(setf (get mav_offboard::UpdateBoundOnlineRequest :datatype-) "mav_offboard/UpdateBoundOnlineRequest")
(setf (get mav_offboard::UpdateBoundOnlineRequest :definition-)
      "geometry_msgs/Vector3 velBound
geometry_msgs/Vector3 accBound

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
---
bool success
bool isBoundUpdate
")

(setf (get mav_offboard::UpdateBoundOnlineResponse :md5sum-) "b63d0873a52c6e04efd40342ee8fed38")
(setf (get mav_offboard::UpdateBoundOnlineResponse :datatype-) "mav_offboard/UpdateBoundOnlineResponse")
(setf (get mav_offboard::UpdateBoundOnlineResponse :definition-)
      "geometry_msgs/Vector3 velBound
geometry_msgs/Vector3 accBound

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
---
bool success
bool isBoundUpdate
")



(provide :mav_offboard/UpdateBoundOnline "b63d0873a52c6e04efd40342ee8fed38")


