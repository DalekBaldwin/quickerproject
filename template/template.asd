;;;; (#|TMPL_VAR name |#).asd

(defpackage #:(#|TMPL_VAR name |#)-system
  (:use :cl :asdf))
(in-package #:(#|TMPL_VAR name |#)-system)

(defsystem #:(#|TMPL_VAR name |#)
  :name "(#|TMPL_VAR name |#)"
  :serial t
  :components
  ((:static-file "(#|TMPL_VAR name |#).asd")
   (:module :src
            :components ((:file "package")
                         (:file "(#|TMPL_VAR name |#)"))
            :serial t))
  :depends-on ())

(defsystem #:(#|TMPL_VAR name |#)-test
  :name "(#|TMPL_VAR name |#)-test"
  :serial t
  :components
  ((:module :test
            :components ((:file "package")
                         (:file "(#|TMPL_VAR name |#)-test" :depends-on ("package")))))
  :depends-on (#:(#|TMPL_VAR name |#) #:stefil))
