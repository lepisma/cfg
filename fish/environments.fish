# Environment variables

# Music
set -x BEETSDIR /media/lepisma/Data/Music/

# Notes
set -x NOTES_DIR /media/lepisma/Data/Cloud/Journal/

# Rust Racer
set -x RUST_SRC_PATH ~/tools/rustc-src/src

# Personal
set -x EMAIL abhinav.tushar.vs@gmail.com
set -x NAME Abhinav Tushar

# PATH
# ----

# Python
set PATH ~/tools/anaconda/bin $PATH

# CUDA
set PATH /usr/local/cuda-7.5/bin $PATH

# Rust bins
set PATH ~/.cargo/bin $PATH

# Go bins
set PATH ~/.go/bin $PATH

# Processing
set PATH ~/tools/processing $PATH

# Haskell
set PATH ~/.cabal/bin $PATH
set PATH /opt/cabal/1.22/bin $PATH
set PATH /opt/ghc/7.10.3/bin $PATH

# Nim
set PATH ~/tools/nim-0.14.2/bin $PATH
set PATH ~/.nimble/bin $PATH

# CUDA Lib
set LD_LIBRARY_PATH /usr/local/cuda-7.5/lib64: $LD_LIBRARY_PATH
