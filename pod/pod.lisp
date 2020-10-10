;;;; pod.lisp

(in-package #:pod)
(enable-interpol-syntax)

(defparameter *browser* "firefox-nightly"
  "Main browser")

(defparameter *alt-browser* "chromium"
  "Alternate browser")

(defparameter *dispatches*
  '(("www" . www)
    ("aux-backup" . aux-backup)
    ("dump-commit-events" . dump-commit-events))
  "Mapping from command to functions.")

(defparameter *www-dispatches*
  `(("^(https?://)?[a-z]*\.google\.co" . ,*alt-browser*)
    ("^(https?://)slack\-redir\.net/link\\?url=(https?%3A%2F%2F)?[a-z]*\.google\.co" . ,*alt-browser*)
    ("^(https?://)?metabase\.ve" . ,*alt-browser*)
    ("^(https?://)?slack-redir\.net/link\\?url=(https?%3A%2F%2F)?metabase\.ve" . ,*alt-browser*)
    ("^(https?://)?outline\.ve" . ,*alt-browser*)
    ("^(https?://)?slack-redir\.net/link\\?url=(https?%3A%2F%2F)?outline\.ve" . ,*alt-browser*)
    ("^(https?://)?discuss\.ve" . ,*alt-browser*)
    ("^(https?://)?slack-redir\.net/link\\?url=(https?%3A%2F%2F)?discuss\.ve" . ,*alt-browser*))
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

(defun format-commit-line (timestamp)
  (multiple-value-bind (year week day) (local-time::%timestamp-decode-iso-week timestamp)
    (format nil "~A,~A-~2,'0d" (local-time:timestamp-to-unix timestamp) year week)))

(defun parse-commit-line (line)
  "Return timestamp from commit event line."
  (let ((text (trim-whitespace (car (split line ",")))))
    (local-time:unix-to-timestamp (parse-integer text))))

(defun commit-events ()
  "Return all the local commit events"
  (-<> (git-repos)
      (mapcar #'repo-commit-events <>)
      (reduce #'append <>)
      (sort #'local-time:timestamp<)
      (remove-duplicates :test #'local-time:timestamp=)))

(defun read-commit-events (file-path)
  "Read commit events as list of timestamps from the given csv path."
  (when (probe-file file-path)
    (-<> (read-file-into-string file-path)
        trim-whitespace
        (split #\linefeed)
        cdr
        (mapcar #'parse-commit-line <>)
        (sort #'local-time:timestamp<)
        (remove-duplicates :test #'local-time:timestamp=))))

(defun merge-commit-events (events-a events-b)
  "Merge events from a and b lists."
  (remove-duplicates (sort (append events-a events-b) #'local-time:timestamp<) :test #'local-time:timestamp=))

(defun dump-commit-events (&rest args)
  (let* ((f-name (or (car args) "./commit-events.csv"))
         (old-events (read-commit-events f-name))
         (separator (make-string 1 :initial-element #\linefeed))
         (header "timestamp,week")
         (new-events (commit-events))
         (lines (mapcar #'format-commit-line (merge-commit-events old-events new-events))))
    (write-string-into-file (join (cons header lines) :separator separator) f-name :if-exists :supersede
                                                                                   :if-does-not-exist :create)))

;;; Aux backup stuff

(defparameter *aux-backup-dirs* (list #p"~/.tofish/d/Vault"
                                      #p"~/.tofish/d/Documents"
                                      #p"~/.tofish/d/Notes"
                                      #p"~/.config/bbq")
  "Directories to backup on secondary cloud.")

(defun backup (dirs outdir outfile)
  (let* ((encrypted (concat outfile ".gpg")))
    (uiop:call-with-current-directory
     (uiop:temporary-directory)
     (lambda ()
       (princ #?"Backing up ${dirs}\n")
       (run/s `(tar czf ,outfile --exclude=pdfs/* ,@dirs))
       (run/s `(gpg --symmetric ,outfile))
       (run/s `(rm ,outfile))
       (run/s `(mv ,encrypted ,(path-join outdir encrypted)))
       (princ #?"File ${encrypted} saved in ${outdir}\n")))))

(defun aux-backup ()
  (backup *aux-backup-dirs* #p"~/.tofish/c/" "aux-backup.tar.gz"))
