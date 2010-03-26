#!/bin/sh

function scm() {
  if [ -e ".svn" ]; then
    echo "svn:"
  elif [ -e ".git" ]; then
    echo "git:"
  elif [ -e "CVS" ]; then
    echo "cvs:"
  elif [ -e "_darcs" ]; then
    echo "darcs:"
  elif [ -n "`grep pwd ~/.svk/config 2>/dev/null`" ]; then
    echo "svk:"
  elif [[ $(git status 2> /dev/null | grep -m 1 'fatal: Not a git repository') != "fatal: Not a git repository" ]]; then
    echo "git:"
  else
    echo ""
  fi
}
