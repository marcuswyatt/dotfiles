#!/bin/zsh

#########
# Shell #
#########
alias reload='source ~/.zshrc'

alias sl=ls # often screw this up

# Find ruby file
alias rfind='find . -name *.rb | xargs grep -n'
alias afind='ack-grep -il'