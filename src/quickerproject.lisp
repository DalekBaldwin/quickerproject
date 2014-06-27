(in-package :quickerproject)

(defun make-project* (pathname &key
                                 depends-on
                                 template-parameters
                                 ((:template-directory *template-directory*)
                                  *template-directory*)
                                 ((:author *author*) *author*)
                                 ((:license *license*) *license*)
                                 (name (pathname-project-name pathname) name-provided-p))
  "Create a project skeleton for NAME in PATHNAME. If DEPENDS-ON is provided,
it is used as the asdf defsystem depends-on list."
  (when (pathname-name pathname)
    (warn "Coercing ~S to directory"
          pathname)
    (setf pathname (pathname-as-directory pathname))
    (unless name-provided-p
      (setf name (pathname-project-name pathname))))
  (labels ((relative (file)
             (merge-pathnames file pathname))
           (nametype (type)
             (relative (make-pathname :name name :type type))))
    (ensure-directories-exist pathname)
    (let ((*default-pathname-defaults* (truename pathname))
          (quickproject::*name* name))
      (when *template-directory*
        (rewrite-templates *template-directory* *default-pathname-defaults*
                           (template-parameters template-parameters)))
      (pushnew *default-pathname-defaults* asdf:*central-registry*
               :test 'equal)
      (dolist (hook *after-make-project-hooks*)
        (funcall hook pathname :depends-on depends-on :name name
                 :allow-other-keys t)))
    name))

(defun make-project (name)
  (let ((project-directory
         (merge-pathnames
          (make-pathname :directory (list :relative name))
          (make-pathname
           :directory (reverse
                       (cdr 
                        (reverse
                         (pathname-directory *system-directory*)))))))
        (template-directory
         (merge-pathnames
          #P"template/"
          *system-directory*)))
    (let ((quickproject:*after-make-project-hooks*
           (list
            (lambda (pathname &key
                                depends-on
                                name
                                allow-other-keys)
              (declare (ignorable pathname depends-on
                                  name allow-other-keys))
              (rename-file
               (merge-pathnames
                #P"template.asd"
                project-directory)
               (merge-pathnames
                (make-pathname :name name
                               :type "asd")
                project-directory))
              (rename-file
               (merge-pathnames
                (make-pathname 
                 :directory '(:relative "src")
                 :name "template"
                 :type "lisp")
                project-directory)
               (merge-pathnames
                (make-pathname 
                 :directory '(:relative "src")
                 :name name
                 :type "lisp")
                project-directory))
              (rename-file
               (merge-pathnames
                (make-pathname 
                 :directory '(:relative "test")
                 :name "template-test"
                 :type "lisp")
                project-directory)
               (merge-pathnames
                (make-pathname 
                 :directory '(:relative "test")
                 :name (format nil "~A-test" name)
                 :type "lisp")
                project-directory))))))

      (make-project* project-directory
                     :template-directory template-directory))))
