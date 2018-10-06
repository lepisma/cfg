;;;; pod.lisp

(in-package #:pod)
(enable-interpol-syntax)

(defparameter browser "firefox-nightly"
  "Main browser")

(defparameter alt-browser "chromium"
  "Alternate browser")

(defparameter www-dispatches
  `(("^(https?://)?[a-z]*\.google\.co" . ,alt-browser)
    ("^(https?://)?wiki\.ver" . ,alt-browser))
  "Patterns for handling url based dispatches.")

(defun www (&rest args)
  "Open browser based on url pattern matches."
  (if (null args)
      (uiop:launch-program browser)
      (unless
        (loop for pattern in www-dispatches
              if (ppcre:scan (car pattern) (car args))
                do (return (uiop:launch-program (list (cdr pattern) (car args)))))
        (uiop:launch-program (list browser (car args))))))
