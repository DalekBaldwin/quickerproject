(in-package #:cl-user)

(defpackage #:(#|TMPL_VAR name |#)-test
  (:use #:cl #:(#|TMPL_VAR name |#) #:stefil)
  (:export
   #:test-all))

(in-package #:(#|TMPL_VAR name |#)-test)

(defparameter *system-directory* (#|TMPL_VAR name |#)::*system-directory*)
