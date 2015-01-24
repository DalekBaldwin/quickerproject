(in-package #:cl-user)

(defpackage #:quickerproject-test
  (:use #:cl #:quickerproject #:stefil)
  (:export
   #:test-all))

(in-package #:quickerproject-test)

(defparameter *system-directory* quickerproject::*system-directory*)
