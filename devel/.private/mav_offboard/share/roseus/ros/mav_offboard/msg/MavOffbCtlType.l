;; Auto-generated. Do not edit!


(when (boundp 'mav_offboard::MavOffbCtlType)
  (if (not (find-package "MAV_OFFBOARD"))
    (make-package "MAV_OFFBOARD"))
  (shadow 'MavOffbCtlType (find-package "MAV_OFFBOARD")))
(unless (find-package "MAV_OFFBOARD::MAVOFFBCTLTYPE")
  (make-package "MAV_OFFBOARD::MAVOFFBCTLTYPE"))

(in-package "ROS")
;;//! \htmlinclude MavOffbCtlType.msg.html


(intern "*OFFBOARD_IGNORE*" (find-package "MAV_OFFBOARD::MAVOFFBCTLTYPE"))
(shadow '*OFFBOARD_IGNORE* (find-package "MAV_OFFBOARD::MAVOFFBCTLTYPE"))
(defconstant mav_offboard::MavOffbCtlType::*OFFBOARD_IGNORE* 0)
(intern "*GOTO_SETPOINT_STEP*" (find-package "MAV_OFFBOARD::MAVOFFBCTLTYPE"))
(shadow '*GOTO_SETPOINT_STEP* (find-package "MAV_OFFBOARD::MAVOFFBCTLTYPE"))
(defconstant mav_offboard::MavOffbCtlType::*GOTO_SETPOINT_STEP* 1)
(intern "*GOTO_SETPOINT_SMOOTH*" (find-package "MAV_OFFBOARD::MAVOFFBCTLTYPE"))
(shadow '*GOTO_SETPOINT_SMOOTH* (find-package "MAV_OFFBOARD::MAVOFFBCTLTYPE"))
(defconstant mav_offboard::MavOffbCtlType::*GOTO_SETPOINT_SMOOTH* 2)
(intern "*GOTO_SETPOINTS_STEP*" (find-package "MAV_OFFBOARD::MAVOFFBCTLTYPE"))
(shadow '*GOTO_SETPOINTS_STEP* (find-package "MAV_OFFBOARD::MAVOFFBCTLTYPE"))
(defconstant mav_offboard::MavOffbCtlType::*GOTO_SETPOINTS_STEP* 3)
(intern "*GOTO_SETPOINTS_SMOOTH*" (find-package "MAV_OFFBOARD::MAVOFFBCTLTYPE"))
(shadow '*GOTO_SETPOINTS_SMOOTH* (find-package "MAV_OFFBOARD::MAVOFFBCTLTYPE"))
(defconstant mav_offboard::MavOffbCtlType::*GOTO_SETPOINTS_SMOOTH* 4)
(intern "*POS_CTRL_BY_ATT*" (find-package "MAV_OFFBOARD::MAVOFFBCTLTYPE"))
(shadow '*POS_CTRL_BY_ATT* (find-package "MAV_OFFBOARD::MAVOFFBCTLTYPE"))
(defconstant mav_offboard::MavOffbCtlType::*POS_CTRL_BY_ATT* 5)
(intern "*POS_CTRL_BY_BODY_RATE*" (find-package "MAV_OFFBOARD::MAVOFFBCTLTYPE"))
(shadow '*POS_CTRL_BY_BODY_RATE* (find-package "MAV_OFFBOARD::MAVOFFBCTLTYPE"))
(defconstant mav_offboard::MavOffbCtlType::*POS_CTRL_BY_BODY_RATE* 6)

(defun mav_offboard::MavOffbCtlType-to-symbol (const)
  (cond
        ((= const 0) 'mav_offboard::MavOffbCtlType::*OFFBOARD_IGNORE*)
        ((= const 1) 'mav_offboard::MavOffbCtlType::*GOTO_SETPOINT_STEP*)
        ((= const 2) 'mav_offboard::MavOffbCtlType::*GOTO_SETPOINT_SMOOTH*)
        ((= const 3) 'mav_offboard::MavOffbCtlType::*GOTO_SETPOINTS_STEP*)
        ((= const 4) 'mav_offboard::MavOffbCtlType::*GOTO_SETPOINTS_SMOOTH*)
        ((= const 5) 'mav_offboard::MavOffbCtlType::*POS_CTRL_BY_ATT*)
        ((= const 6) 'mav_offboard::MavOffbCtlType::*POS_CTRL_BY_BODY_RATE*)
        (t nil)))

(defclass mav_offboard::MavOffbCtlType
  :super ros::object
  :slots (_mav_offb_ctl_type ))

(defmethod mav_offboard::MavOffbCtlType
  (:init
   (&key
    ((:mav_offb_ctl_type __mav_offb_ctl_type) 0)
    )
   (send-super :init)
   (setq _mav_offb_ctl_type (round __mav_offb_ctl_type))
   self)
  (:mav_offb_ctl_type
   (&optional __mav_offb_ctl_type)
   (if __mav_offb_ctl_type (setq _mav_offb_ctl_type __mav_offb_ctl_type)) _mav_offb_ctl_type)
  (:serialization-length
   ()
   (+
    ;; uint8 _mav_offb_ctl_type
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _mav_offb_ctl_type
       (write-byte _mav_offb_ctl_type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _mav_offb_ctl_type
     (setq _mav_offb_ctl_type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get mav_offboard::MavOffbCtlType :md5sum-) "ecfa29034218f9eaa269cda4f3eba64a")
(setf (get mav_offboard::MavOffbCtlType :datatype-) "mav_offboard/MavOffbCtlType")
(setf (get mav_offboard::MavOffbCtlType :definition-)
      "
# mav offb control type for diff tasks
uint8 mav_offb_ctl_type

uint8 OFFBOARD_IGNORE = 0

uint8 GOTO_SETPOINT_STEP = 1
uint8 GOTO_SETPOINT_SMOOTH = 2

uint8 GOTO_SETPOINTS_STEP = 3
uint8 GOTO_SETPOINTS_SMOOTH = 4

uint8 POS_CTRL_BY_ATT = 5

uint8 POS_CTRL_BY_BODY_RATE = 6
")



(provide :mav_offboard/MavOffbCtlType "ecfa29034218f9eaa269cda4f3eba64a")


