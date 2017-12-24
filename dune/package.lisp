;;;; package.lisp

(defpackage #:dune
  (:use #:cl
        #:alexandria
        #:anaphora
        #:serapeum
        #:cl-strings
        #:cl-arrows
        #:cl-ppcre
        #:cl-cut)
  (:shadowing-import-from #:cl-strings
   :starts-with :ends-with :parse-number :split)
  (:shadowing-import-from #:cl-arrows
   :->)
  (:shadowing-import-from #:serapeum
   :scan))
