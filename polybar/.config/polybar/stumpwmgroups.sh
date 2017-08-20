#!/bin/sh

echo "
(apply #'concatenate 'string (mapcar
                              (lambda (g)
                                (let ((name (string-upcase (group-name g))))
                                  (if (eq g (current-group))
                                      (concat \"%{F#ffffff B#161616 o#fb2874 +o} \" name \" %{F- B- o- -o}\")
                                      (concat \"%{F#65737E} \" name \" %{F-}\"))))
                              (sort (screen-groups (current-screen)) #'< :key #'group-number)))" | stumpish -e eval
