#!/bin/sh

echo "
(apply #'concatenate 'string (mapcar
                              (lambda (g)
                                (let* ((name (string-upcase (group-name g)))
                                       (display-text (cond ((string-equal name \"MAIN\" ) \"   MAIN  \")
                                                           ((string-equal name \"DOCS\") \"   DOCS  \")
                                                           ((string-equal name \"FLOAT\") \"   FLOAT  \")
                                                           (t (concat \"   \" name \"  \")))))
                                  (if (eq g (current-group))
                                      (concat \"%{F#fff B#111 u#16A085 +u}\" display-text \"%{F- B- u- -u}\")
                                      (concat \"%{F#777}\" display-text \"%{F-}\"))))
                              (sort (screen-groups (current-screen)) #'< :key #'group-number)))" | stumpish -e eval
