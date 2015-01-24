(in-package :cl-user)

(defpackage :(#|TMPL_VAR name |#)
  (:use :cl))

(in-package :(#|TMPL_VAR name |#))

(defparameter *system-directory*
  (make-pathname
   :directory
   (pathname-directory
    (asdf:system-definition-pathname "(#|TMPL_VAR name |#)"))))
