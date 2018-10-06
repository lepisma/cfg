;;;; pod.asd

(defsystem #:pod
  :description "Scripts in common lisp"
  :author "Abhinav Tushar <lepisma@fastmail.com>"
  :license "GPLv3"
  :depends-on (#:alexandria
               #:anaphora
               #:serapeum
               #:cl-strings
               #:cl-arrows
               #:cl-ppcre
               #:cl-cut
               #:cl-interpol
               #:inferior-shell
               #:trivia
               #:uiop)
  :serial t
  :components ((:file "package")
               (:file "pod")))
