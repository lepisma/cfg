set -x DATA_DIR /home/lepisma
set -x CLOUD_DIR $DATA_DIR/Nextcloud
set -x PROJECTS_DIR $CLOUD_DIR/projects

set -x EMAIL abhinav@lepisma.xyz
set -x NAME Abhinav Tushar

set -x EDITOR mumacs
set -x PAGER less
set -x BROWSER www

set -a PATH ~/bin
set -a PATH ~/.local/bin
set -a PATH ~/.cask/bin
set -a PATH ~/.cargo/bin
set -a PATH ~/.config/rofi/bin

set -x RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src
set -a LD_LIBRARY_PATH /usr/local/lib
