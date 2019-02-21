# Directories
set -x DATA_DIR /run/media/lepisma/Data
set -x CLOUD_DIR $DATA_DIR/Cloud
set -x PROJECTS_DIR $DATA_DIR/Projects

# Personal
set -x EMAIL lepisma@fastmail.com
set -x NAME Abhinav Tushar

set -gx EDITOR mumacs
set -gx PAGER less
set -gx BROWSER www
set -x BORG_REPO $CLOUD_DIR/Backup

# PATH
set PATH ~/bin $PATH
set PATH ~/.local/bin $PATH
set PATH ~/.cask/bin $PATH
set PATH ~/.roswell/bin $PATH
set PATH ~/.pkr/bin $PATH
set PATH (rbenv prefix)/bin $PATH
set PATH ~/.cargo/bin $PATH
set PATH ~/.pyenv/bin $PATH
set PATH ~/.poetry/bin $PATH
set PATH ~/go/bin $PATH

# pyenv
status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)

# Rust stuff
set -x RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src

# Qt5 stuff
set -x QT_QPA_PLATFORMTHEME "qt5ct"

# fast-nvm
nvm use default
