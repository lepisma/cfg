;;;; package.lisp

(defpackage #:pod
  (:use #:cl
        #:alexandria
        #:anaphora
        #:serapeum
        #:cl-strings
        #:cl-arrows
        #:cl-ppcre
        #:cl-cut
        #:cl-interpol
        #:inferior-shell
        #:lparallel
        #:trivia)
  (:shadowing-import-from #:anaphora
   :slet)
  (:shadowing-import-from #:cl-strings
   :starts-with :ends-with :parse-number :split)
  (:shadowing-import-from #:cl-arrows
   :->)
  (:shadowing-import-from #:serapeum
   :scan :@)
  (:shadowing-import-from #:inferior-shell
   :fork)
  (:shadowing-import-from #:trivia
   :<>)
  (:export #:*dispatches*))
