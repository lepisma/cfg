;; Init file for light emacs

(setq make-backup-files nil)

(menu-bar-mode -1)

(load-theme 'wombat)

;; Disable background color https://stackoverflow.com/a/20233611
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)
