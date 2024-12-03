
(cl:in-package :asdf)

(defsystem "mav_offboard-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :mav_offboard-msg
               :mavros_msgs-msg
)
  :components ((:file "_package")
    (:file "GenTrajOnline" :depends-on ("_package_GenTrajOnline"))
    (:file "_package_GenTrajOnline" :depends-on ("_package"))
    (:file "IintWayPoints" :depends-on ("_package_IintWayPoints"))
    (:file "_package_IintWayPoints" :depends-on ("_package"))
    (:file "SetMavOffbCtlType" :depends-on ("_package_SetMavOffbCtlType"))
    (:file "_package_SetMavOffbCtlType" :depends-on ("_package"))
    (:file "SetTargPoint" :depends-on ("_package_SetTargPoint"))
    (:file "_package_SetTargPoint" :depends-on ("_package"))
    (:file "UpdateBoundOnline" :depends-on ("_package_UpdateBoundOnline"))
    (:file "_package_UpdateBoundOnline" :depends-on ("_package"))
  ))