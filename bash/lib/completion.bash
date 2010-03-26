#!/bin/sh

#generated by lightning from http://github.com/cldwalker/lightning/tree/master
if [ -f $BASH/completions/lightning_completions.bash ]; then
  source $BASH/completions/lightning_completions.bash
fi

#generated by tabtab from http://github.com/drnic/tabtab/tree/master
if [ -f $BASH/completions/.tabtab.bash ]; then
  source $BASH/completions/tabtab.bash
fi

if [ -f $BASH/completions/git-completion.bash ]; then
  source $BASH/completions/git-completion.bash
fi

#completion for cheat
if [ ! -r ~/.cheat_completion ]; then
  echo "Rebuilding Cheat cache... "
  cheat sheets | egrep '^ ' | awk {'print $1'} > ~/.cheat_completion
fi
complete -W "$(cat ~/.cheat_completion)" cheat

complete -C $BASH/completions/rake_and_cap_completion.rb -o default rake
complete -C $BASH/completions/rake_and_cap_completion.rb -o default cap
complete -C $BASH/completions/sake_completer.rb -o default sake
complete -C $BASH/completions/thor_completer.rb -o default thor t
complete -d cd cl
complete -v set
complete -A helptopic help
