
(cl:in-package :asdf)

(defsystem "mav_offboard-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "MavOffbCtlType" :depends-on ("_package_MavOffbCtlType"))
    (:file "_package_MavOffbCtlType" :depends-on ("_package"))
  ))