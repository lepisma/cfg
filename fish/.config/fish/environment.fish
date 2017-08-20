# Directories
set -x JOURNAL_DIR /run/media/lepisma/Data/Cloud/Journal
set -x PROJECTS_DIR /run/media/lepisma/Data/Projects

# Personal
set -x EMAIL abhinav.tushar.vs@gmail.com
set -x NAME Abhinav Tushar

set -x EDITOR micro
set -x RTV_EDITOR micro
set -x PAGER less
set -x XDG_MUSIC_DIR /run/media/lepisma/Data/Music
set -x VIRTUAL_ENV_DISABLE_PROMPT TRUE
set -x BORG_REPO /run/media/lepisma/Data/Cloud/Backup

# PATH
set PATH ~/bin $PATH
set PATH ~/tools/anaconda/bin $PATH
set PATH ~/.cask/bin $PATH
set PATH ~/.roswell/bin $PATH
set PATH ~/.pkr/bin $PATH
set PATH /usr/local/cuda-8.0/bin $PATH

set LD_LIBRARY_PATH /usr/local/cuda-8.0/lib64 $LD_LIBRARY_PATH
set LD_LIBRARY_PATH ~/tools/anaconda/lib $LD_LIBRARY_PATH
