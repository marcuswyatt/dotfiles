#!/bin/bash
echo 'bashprofile'

if [ -f /etc/bashrc ]; then
  source $HOME/.bashrc
fi

if [[ -s /Users/Marcus/.rvm/scripts/rvm ]] ; then
  source /Users/Marcus/.rvm/scripts/rvm ;
fi