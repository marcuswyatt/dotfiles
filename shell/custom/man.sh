#!/bin/sh

# Open a man page in Preview
pman () {
    man -t "${1}" | open -f -a /Applications/Preview.app
}

# Open a man page in TextMate
tman () {
  MANWIDTH=160 MANPAGER='col -bx' man $@ | mate
}