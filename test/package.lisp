(in-package :cl-user)

(defpackage :quickerproject-test
  (:use :cl :quickerproject :stefil))

(in-package :quickerproject-test)

(defparameter *system-directory*
  (make-pathname
   :directory 
   (pathname-directory
    (asdf:system-definition-pathname :quickerproject))))
