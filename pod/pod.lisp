;;;; pod.lisp

(in-package #:pod)
(enable-interpol-syntax)

(defparameter *browser* "firefox-nightly"
  "Main browser")

(defparameter *alt-browser* "chromium"
  "Alternate browser")

(defparameter *dispatches*
  '(("www" . www)
    ("aux-backup" . aux-backup))
  "Mapping from command to functions.")

(defparameter *www-dispatches*
  `(("^(https?://)?[a-z]*\.google\.co" . ,*alt-browser*)
    ("^(https?://)slack\-redir\.net/link\\?url=(https?%3A%2F%2F)?[a-z]*\.google\.co" . ,*alt-browser*)
    ("^(https?://)?wiki\.ver" . ,*alt-browser*)
    ("^(https?://)?slack-redir\.net/link\\?url=(https?%3A%2F%2F)?wiki\.ver" . ,*alt-browser*))
  "Patterns for handling url based dispatches.")

(defun www (&rest args)
  "Open browser based on url pattern matches."
  (if (null args)
      (uiop:launch-program *browser*)
      (unless
        (loop for pattern in *www-dispatches*
              if (ppcre:scan (car pattern) (car args))
                do (return (uiop:launch-program (list (cdr pattern) (car args)))))
        (uiop:launch-program (list *browser* (car args))))))

;;; Git analysis stuff

(defparameter *git-author* "Abhinav Tushar"
  "Author name to look for in git logs.")

(defparameter *repos-dirs* (list #p"~/.tofish/p/"
                                 #p"~/cfg"
                                 #p"~/Desktop"
                                 #p"~/.tofish/r")
  "Directories where git repositories might be present.")

(defun git-repos-in-dir (dir-path)
  "Return a list of git repositories"
  (let ((find-out (run/s `(find "-L" ,dir-path -name "\*.git" -type d))))
    (mapcar #'pathname-directory (split (trim-whitespace find-out) #\linefeed))))

(defun git-repos ()
  "Return all git repositories."
  (reduce #'append (mapcar #'git-repos-in-dir *repos-dirs*)))

(defun repo-commit-events (path-spec)
  "Return a list of commit events (times) for the repo."
  (uiop:call-with-current-directory
   (make-pathname :directory path-spec)
   (lambda ()
     (let ((log-out (trim-whitespace (run/s `(git log --all --author ,*git-author* "--pretty=format:%at")))))
       (unless (string-equal "" log-out)
         (mapcar (compose #'local-time:unix-to-timestamp #'parse-integer) (split log-out #\linefeed)))))))

(defun commit-events ()
  (reduce #'append (mapcar #'repo-commit-events (git-repos))))


;;; Aux backup stuff

(defparameter *aux-backup-dirs* (list #p"~/.tofish/d/Vault"
                                      #p"~/.tofish/d/Documents"
                                      #p"~/.tofish/d/Notes")
  "Directories to backup on secondary cloud.")

(defun backup (dirs outdir outfile)
  (let* ((encrypted (concat outfile ".gpg")))
    (uiop:call-with-current-directory
     (uiop:temporary-directory)
     (lambda ()
       (princ #?"Backing up ${dirs}\n")
       (run/s `(tar czf ,outfile ,@dirs))
       (run/s `(gpg --symmetric ,outfile))
       (run/s `(rm ,outfile))
       (run/s `(mv ,encrypted ,(path-join outdir encrypted)))
       (princ #?"File ${encrypted} saved in ${outdir}\n")))))

(defun aux-backup ()
  (backup *aux-backup-dirs* #p"~/.tofish/c/" "aux-backup.tar.gz"))
