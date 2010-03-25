#
# zprofile
# -------
#   read after zshenv, if the shell is a login shell
#
# .zprofile
# -------
#   read after zprofile, if the shell is a login shell
#
# echo 'zprofile'

if [[ -s /Users/Marcus/.rvm/scripts/rvm ]] ; then
  source /Users/Marcus/.rvm/scripts/rvm ;
fi

# if [[ -s /Users/Marcus/.rvm/scripts/cd ]]; then
#   source /Users/Marcus/.rvm/scripts/cd
# fi