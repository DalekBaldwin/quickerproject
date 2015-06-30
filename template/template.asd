;;;; (#|TMPL_VAR name |#).asd

(defpackage :(#|TMPL_VAR name |#)-system
  (:use :cl :asdf))
(in-package :(#|TMPL_VAR name |#)-system)

(defsystem :(#|TMPL_VAR name |#)
  :name "(#|TMPL_VAR name |#)"
  :serial t
  :components
  ((:static-file "(#|TMPL_VAR name |#).asd")
   (:module :src
            :components ((:file "package")
                         (:file "(#|TMPL_VAR name |#)"))
            :serial t))
  :depends-on ()
  :in-order-to ((test-op (load-op :(#|TMPL_VAR name |#)-test)))
  :perform (test-op :after (op c)
                    (funcall
                     (intern #.(string '#:run-all-tests)
                             :(#|TMPL_VAR name |#)-test))))

(defsystem :(#|TMPL_VAR name |#)-test
  :name "(#|TMPL_VAR name |#)-test"
  :serial t
  :description "Tests for (#|TMPL_VAR name |#)."
  :components
  ((:module :test
            :components ((:file "package")
                         (:file "(#|TMPL_VAR name |#)-test"))))
  :depends-on (:(#|TMPL_VAR name |#) :stefil))
