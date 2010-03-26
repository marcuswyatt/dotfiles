#!/bin/sh

# get the name of the branch we are on
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$THEME_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$THEME_PROMPT_SUFFIX"
}

parse_git_dirty () {
  if [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]]; then
    echo "$THEME_PROMPT_DIRTY"
  else
    echo "$THEME_PROMPT_CLEAN"
  fi
}

#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

# Aliases
alias g='git'
alias gst='git status'
alias gpl='git pull'
alias gup='git fetch && git rebase'
alias gpu='git push'
alias gdm='git diff | mate'
alias gdv='git diff -w "$@" | vim -R -'
alias gcv='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'

# Git and svn mix
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'