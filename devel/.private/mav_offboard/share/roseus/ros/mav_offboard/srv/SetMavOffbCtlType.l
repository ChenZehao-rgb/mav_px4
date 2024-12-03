;; Auto-generated. Do not edit!


(when (boundp 'mav_offboard::SetMavOffbCtlType)
  (if (not (find-package "MAV_OFFBOARD"))
    (make-package "MAV_OFFBOARD"))
  (shadow 'SetMavOffbCtlType (find-package "MAV_OFFBOARD")))
(unless (find-package "MAV_OFFBOARD::SETMAVOFFBCTLTYPE")
  (make-package "MAV_OFFBOARD::SETMAVOFFBCTLTYPE"))
(unless (find-package "MAV_OFFBOARD::SETMAVOFFBCTLTYPEREQUEST")
  (make-package "MAV_OFFBOARD::SETMAVOFFBCTLTYPEREQUEST"))
(unless (find-package "MAV_OFFBOARD::SETMAVOFFBCTLTYPERESPONSE")
  (make-package "MAV_OFFBOARD::SETMAVOFFBCTLTYPERESPONSE"))

(in-package "ROS")





(defclass mav_offboard::SetMavOffbCtlTypeRequest
  :super ros::object
  :slots (_ctlType ))

(defmethod mav_offboard::SetMavOffbCtlTypeRequest
  (:init
   (&key
    ((:ctlType __ctlType) (instance mav_offboard::MavOffbCtlType :init))
    )
   (send-super :init)
   (setq _ctlType __ctlType)
   self)
  (:ctlType
   (&rest __ctlType)
   (if (keywordp (car __ctlType))
       (send* _ctlType __ctlType)
     (progn
       (if __ctlType (setq _ctlType (car __ctlType)))
       _ctlType)))
  (:serialization-length
   ()
   (+
    ;; mav_offboard/MavOffbCtlType _ctlType
    (send _ctlType :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; mav_offboard/MavOffbCtlType _ctlType
       (send _ctlType :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; mav_offboard/MavOffbCtlType _ctlType
     (send _ctlType :deserialize buf ptr-) (incf ptr- (send _ctlType :serialization-length))
   ;;
   self)
  )

(defclass mav_offboard::SetMavOffbCtlTypeResponse
  :super ros::object
  :slots (_success ))

(defmethod mav_offboard::SetMavOffbCtlTypeResponse
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

(defclass mav_offboard::SetMavOffbCtlType
  :super ros::object
  :slots ())

(setf (get mav_offboard::SetMavOffbCtlType :md5sum-) "ba3bb96f001193382c990776aa0640ca")
(setf (get mav_offboard::SetMavOffbCtlType :datatype-) "mav_offboard/SetMavOffbCtlType")
(setf (get mav_offboard::SetMavOffbCtlType :request) mav_offboard::SetMavOffbCtlTypeRequest)
(setf (get mav_offboard::SetMavOffbCtlType :response) mav_offboard::SetMavOffbCtlTypeResponse)

(defmethod mav_offboard::SetMavOffbCtlTypeRequest
  (:response () (instance mav_offboard::SetMavOffbCtlTypeResponse :init)))

(setf (get mav_offboard::SetMavOffbCtlTypeRequest :md5sum-) "ba3bb96f001193382c990776aa0640ca")
(setf (get mav_offboard::SetMavOffbCtlTypeRequest :datatype-) "mav_offboard/SetMavOffbCtlTypeRequest")
(setf (get mav_offboard::SetMavOffbCtlTypeRequest :definition-)
      "mav_offboard/MavOffbCtlType ctlType

================================================================================
MSG: mav_offboard/MavOffbCtlType

# mav offb control type for diff tasks
uint8 mav_offb_ctl_type

uint8 OFFBOARD_IGNORE = 0

uint8 GOTO_SETPOINT_STEP = 1
uint8 GOTO_SETPOINT_SMOOTH = 2

uint8 GOTO_SETPOINTS_STEP = 3
uint8 GOTO_SETPOINTS_SMOOTH = 4

uint8 POS_CTRL_BY_ATT = 5

---
bool success
")

(setf (get mav_offboard::SetMavOffbCtlTypeResponse :md5sum-) "ba3bb96f001193382c990776aa0640ca")
(setf (get mav_offboard::SetMavOffbCtlTypeResponse :datatype-) "mav_offboard/SetMavOffbCtlTypeResponse")
(setf (get mav_offboard::SetMavOffbCtlTypeResponse :definition-)
      "mav_offboard/MavOffbCtlType ctlType

================================================================================
MSG: mav_offboard/MavOffbCtlType

# mav offb control type for diff tasks
uint8 mav_offb_ctl_type

uint8 OFFBOARD_IGNORE = 0

uint8 GOTO_SETPOINT_STEP = 1
uint8 GOTO_SETPOINT_SMOOTH = 2

uint8 GOTO_SETPOINTS_STEP = 3
uint8 GOTO_SETPOINTS_SMOOTH = 4

uint8 POS_CTRL_BY_ATT = 5

---
bool success
")



(provide :mav_offboard/SetMavOffbCtlType "ba3bb96f001193382c990776aa0640ca")


