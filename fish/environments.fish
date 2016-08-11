# Environment variables

# BEETSDIR
set -x BEETSDIR /media/lepisma/Data/Music/

# Deft notes
set -x NOTES_DIR /media/lepisma/Data/Dropbox/Journal/

# Go things
set -x GOROOT ~/tools/go
set -x GOPATH ~/.go

# Racer
set -x RUST_SRC_PATH ~/tools/rustc-1.10.0/src

# Personal
set -x EMAIL abhinav.tushar.vs@gmail.com
set -x NAME Abhinav Tushar

# Torch
bass source ~/tools/torch/install/bin/torch-activate

# Path
set PATH ~/tools/anaconda/bin $PATH
set PATH ~/tools/go/bin $PATH
set PATH /usr/local/cuda-7.5/bin $PATH
set PATH ~/.cargo/bin $PATH
set PATH ~/tools/processing $PATH
set PATH ~/.cabal/bin $PATH
set PATH /opt/cabal/1.22/bin $PATH
set PATH /opt/ghc/7.10.3/bin $PATH
set PATH ~/tools/nim-0.14.2/bin $PATH
set PATH ~/.nimble/bin $PATH

# CUDA
set LD_LIBRARY_PATH /usr/local/cuda-7.5/lib64: $LD_LIBRARY_PATH
