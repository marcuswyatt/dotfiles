# TODO: Ensure we create a gitconfig in private and install it in /usr/local/git/etc/gitconfig
# TODO: Ensure we create a gemrc in private and install it in /usr/gemrc

if [ -e "$HOME/.zshrc" ]
then
  echo "It seems zsh is already configured; overwrite (yes/no)?"
  read answer

  if [ "$answer" != yes ]
  then
    ./zsh/tools/install.sh
  fi
else
  exec ./zsh/tools/install.sh
fi