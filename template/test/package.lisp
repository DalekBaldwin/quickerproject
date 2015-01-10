(in-package :cl)

(defpackage :(#|TMPL_VAR name |#)-test
  (:use :cl :(#|TMPL_VAR name |#) :stefil)
  (:export
   #:test-all))

(in-package :(#|TMPL_VAR name |#)-test)

(defparameter *system-directory*
  (make-pathname
   :directory 
   (pathname-directory
    (asdf:system-definition-pathname :(#|TMPL_VAR name |#)))))
