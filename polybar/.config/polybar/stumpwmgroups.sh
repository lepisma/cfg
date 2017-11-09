#!/bin/sh

echo "
(apply #'concatenate 'string (mapcar
                              (lambda (g)
                                (let* ((name (string-upcase (group-name g)))
                                       (n-win (write-to-string (length (group-windows g))))
                                       (display-text (cond ((string-equal name \"MAIN\" ) \"   MAIN \")
                                                           ((string-equal name \"DOCS\") \"   1 DOCS \")
                                                           ((string-equal name \"FLOAT\") \"   2 FLOAT \")
                                                           (t (concat \"   \" name \"  \")))))
                                  (if (eq g (current-group))
                                      (concat \"%{F#fff B#dd8a9899 u#8a9899 +u}\" display-text \"[\" n-win \"] \" \"%{F- B- u- -u}\")
                                      (concat \"%{F#333}\" display-text \"[\" n-win \"] \" \"%{F-}\"))))
                              (sort (screen-groups (current-screen)) #'< :key #'group-number)))" | stumpish -e eval
