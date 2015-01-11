(in-package :cl-user)

(defpackage :quickerproject
  (:use :cl)
  (:import-from :quickproject
                :pathname-as-directory
                :pathname-project-name
                :rewrite-templates
                :template-parameters
                :*name*
                :*author*
                :*license*
                :*template-directory*
                :*after-make-project-hooks*)
  (:export
   #:make-project))

(in-package :quickerproject)

(defparameter *system-directory*
  (make-pathname
   :directory 
   (pathname-directory
    (asdf:system-definition-pathname :quickerproject))))
