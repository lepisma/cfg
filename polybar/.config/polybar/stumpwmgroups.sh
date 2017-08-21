#!/bin/sh

echo "
(apply #'concatenate 'string (mapcar
                              (lambda (g)
                                (let ((name (string-upcase (group-name g))))
                                  (if (eq g (current-group))
                                      (concat \"%{F#ffffff B#161616 u#fb2874 +u} \" name \" %{F- B- u- -u}\")
                                      (concat \"%{F#65737E} \" name \" %{F-}\"))))
                              (sort (screen-groups (current-screen)) #'< :key #'group-number)))" | stumpish -e eval
