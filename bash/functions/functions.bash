#!/bin/bash

cl () {
    cd $1;
    shift;
    ls $a
}

rmt () {
    #move files to Trash bin, for files I'm not 100% sure to delete
    mv -i $@ $HOME/temp/trash/
}

#from http://github.com/defunkt/barefootexamples/blob/a4e0158e0bb0bc39121841c787d15bbcfe0a0e27/07bash.sh
function vimgr {
  vim -O `egrep -r -l $1 * | grep -v .svn`
}

function hf() {
  history | grep $1
}

# really awesome function, use: cdgem <gem name>, cd's into your gems directory
# and opens gem that best matches the gem name provided
function cdgem {
  cd `gem env gemdir`/gems
  cd `ls | grep $1 | sort | tail -1`
}

function gemls {
  GEMDIR=`gem env gemdir`/gems
  ls $GEMDIR | sort | more
}

function gemdoc {
  GEMDIR=`gem env gemdir`/doc
  open $GEMDIR/`ls $GEMDIR | grep $1 | sort | tail -1`/rdoc/index.html
}

function mategem {
  GEMDIR=`gem env gemdir`/gems
  mate $GEMDIR/`ls $GEMDIR | grep $1 | sort | tail -1`
}

function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git::\1)/'
}

function parse_svn_branch() {
  parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk -F / '{print "(svn::"$1 "/" $2 ")"}'
}

function parse_svn_url() {
  svn info 2>/dev/null | grep -e '^URL*' | sed -e 's#^URL: *\(.*\)#\1#g '
}

function parse_svn_repository_root() {
  svn info 2>/dev/null | grep -e '^Repository Root:*' | sed -e 's#^Repository Root: *\(.*\)#\1\/#g '
}

function gco {
  if [ -z "$1" ]; then
    git checkout master
  else
    git checkout $1
  fi
}

function st {
  if [ -d ".svn" ]; then
    svn status
  else
    git status
  fi
}

# a function to exchange the names of two files
function switch()
{
   local tmp=$$switch
   mv "$1" $tmp
   mv "$2" "$1"
   mv $tmp "$2"
}

function pidof () {
  ps -Ac | egrep $@ | awk '{print $1}';
}

# Change directory and open TextMate in a single command
# Usage: tm ~/Projects/sites/tomafro.net

function tmate() {
  cd $1
  mate $1
}
