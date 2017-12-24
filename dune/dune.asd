;;;; dune.asd

(asdf:defsystem #:dune
  :description "Package collecting other packages for small scale scripting"
  :author "Abhinav Tushar <lepisma@fastmail.com>"
  :license "GPLv3"
  :depends-on (#:alexandria
               #:anaphora
               #:serapeum
               #:cl-strings
               #:cl-arrows
               #:cl-ppcre
               #:cl-cut)
  :serial t
  :components ((:file "package")
               (:file "dune")))
