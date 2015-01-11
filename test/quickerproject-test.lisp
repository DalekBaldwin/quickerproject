(in-package :quickerproject-test)

(defsuite* test-all)

(deftest test-quickerproject ()
  (make-project "quickerproject-test-project")
  (ql:quickload :quickerproject-test-project)
  (ql:quickload :quickerproject-test-project-test)
  (eval (read-from-string "(quickerproject-test-project-test:test-all)"))
  (is t)
  (format t "~&Quickerproject successfully generated a testable project.~%"))
