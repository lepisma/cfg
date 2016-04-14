# Environment variables

# BEETSDIR
set -x BEETSDIR /media/lepisma/Data/Music/

# NVM mirror
set -x NVM_NODEJS_ORG_MIRROR http://nodejs.org/dist

# Deft notes
set -x NOTES_DIR /media/lepisma/Dropbox/Journal/

# Go root
set -x GOROOT ~/tools/go

# Path
set PATH ~/tools/anaconda/bin $PATH
set PATH ~/tools/go/bin $PATH

# Torch to path
bass source ~/tools/torch/install/bin/torch-activate
