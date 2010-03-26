echo "Looking for an existing zsh config..."
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]
then
  echo "Found ~/.zshrc. Backing up to ~/.zshrc.backup";
  cp ~/.zshrc ~/.zshrc.backup;
  rm ~/.zshrc;
fi

echo "Copying your current PATH and adding it to the ./private/paths.zsh file"
if [[ -e ./private/paths.zsh  ]]; then
  touch ./private/paths.zsh
  echo "export PATH=$PATH" >> ./private/paths.zsh
fi

# Path to your zsh configuration.
ZSH=/Volumes/Data/Marcus/Personal/dotfiles/zsh

echo "Create symlink for all the z files (zlogin, zlogout, zprofile, zshenv, zshrc)"
for zfile in $ZSH/*.zsh; do
  ln -sF $zfile $HOME/.`basename $zfile .zsh`
done

echo "Time to change your default shell to zsh!"
chsh -s /bin/zsh

echo "Hooray! Zsh has been installed."
/bin/zsh
source ~/.zshrc
