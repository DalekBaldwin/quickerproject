(in-package :cl)

(defpackage :(#|TMPL_VAR name |#)
  (:use :cl))

(in-package :(#|TMPL_VAR name |#))

(defparameter *system-directory*
  (make-pathname
   :directory 
   (slot-value
    (asdf:system-definition-pathname :(#|TMPL_VAR name |#))
    'directory)))
