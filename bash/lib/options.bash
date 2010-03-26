#!/bin/bash

# shell options
set meta-flag on
set input-meta on
set output-meta on
set convert-meta off
set -o noclobber                  # prevent overwriting files
stty kill '^u'                    # set kill line to control-u
#for mac osx
bind "set completion-ignore-case on"
