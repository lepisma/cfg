#!/bin/sh

echo "
(apply #'concatenate 'string (mapcar
                              (lambda (g)
                                (let* ((name (string-upcase (group-name g)))
                                       (n-win (write-to-string (length (group-windows g))))
                                       (display-text (cond ((string-equal name \"MAIN\" ) \"   MAIN \")
                                                           ((string-equal name \"CANVAS\") \"   CANVAS \")
                                                           ((string-equal name \"FLOAT\") \"   FLOAT \")
                                                           (t (concat \"   \" name \"  \")))))
                                  (if (eq g (current-group))
                                      (concat \"%{F#eeeeee B#3B4252 u#8a9899 +u}\" display-text \"[\" n-win \"] \" \"%{F- B- u- -u}\")
                                      (concat \"%{F#8a9899}\" display-text \"[\" n-win \"] \" \"%{F-}\"))))
                              (sort (screen-groups (current-screen)) #'< :key #'group-number)))" | stumpish -e eval
