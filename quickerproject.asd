;;;; quickerproject.asd

(defpackage :quickerproject-system
  (:use :cl :asdf))
(in-package :quickerproject-system)

(defsystem :quickerproject
  :name "quickerproject"
  :serial t
  :components
  ((:static-file "quickerproject.asd")
   (:module :src
            :components ((:file "package")
                         (:file "quickerproject" :depends-on ("package")))))
  :depends-on (:quickproject)
  :in-order-to ((test-op (load-op :quickerproject-test)))
  :perform (test-op :after (op c)
                    (funcall
                     (intern #.(string '#:run-all-tests)
                             :quickerproject-test))))

(defsystem :quickerproject-test
  :name "quickerproject-test"
  :serial t
  :description "Tests for quickerproject."
  :components
  ((:module :test
            :components ((:file "package")
                         (:file "quickerproject-test" :depends-on ("package")))))
  :depends-on (:quickerproject :stefil))
