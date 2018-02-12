# Directories
set -x JOURNAL_DIR /run/media/lepisma/Data/Cloud/Journal
set -x PROJECTS_DIR /run/media/lepisma/Data/Projects

# Personal
set -x EMAIL lepisma@fastmail.com
set -x NAME Abhinav Tushar

set -x EDITOR mumacs
set -x PAGER less
set -x BROWSER firefox-nightly
set -x XDG_MUSIC_DIR /run/media/lepisma/Data/Music
set -x BORG_REPO /run/media/lepisma/Data/Cloud/Backup

# PATH
set PATH ~/bin $PATH
set PATH ~/.local/bin $PATH
set PATH ~/.cask/bin $PATH
set PATH ~/.roswell/bin $PATH
set PATH ~/.pkr/bin $PATH
set PATH ~/.pyenv/bin $PATH
set PATH (rbenv prefix)/bin $PATH
set PATH ~/.cargo/bin $PATH
set PATH /snap/bin $PATH

# Rust stuff
set -x RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src

# Pyenv stuff
set -x PYENV_ROOT ~/.pyenv
status --is-interactive; and . (pyenv init -|psub)

# Conda
source ~/.pyenv/versions/miniconda3-latest/etc/fish/conf.d/conda.fish
