#!/usr/bin/env fish

# Setup symlinks
set linkDirs conkeror fish jed git matplotlib scripts redshift

for directory in $linkDirs
  stow -t ~/ $directory
end
