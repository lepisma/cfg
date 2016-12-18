#!/usr/bin/env fish

# Setup symlinks
set linkDirs bibtex conkeror fish jed git matplotlib scripts

for directory in $linkDirs
  stow -t ~/ $directory
end
