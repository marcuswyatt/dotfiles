echo "Looking for an existing zsh config..."
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]
then
  echo "Found ~/.zshrc. Backing up to ~/.zshrc.backup";
  cp ~/.zshrc ~/.zshrc.backup;
  rm ~/.zshrc;
fi

echo "Using the Zsh template file and adding it to ~/.zshrc"
cp ../templates/zshrc.zsh-template ~/.zshrc

echo "Copying your current PATH and adding it to the ./private/paths.zsh file"
echo "export PATH=$PATH" >> ./private/paths.zsh

echo "Time to change your default shell to zsh!"
chsh -s /bin/zsh

echo "Hooray! Zsh has been installed."
/bin/zsh
source ~/.zshrc


# TODO: intall the login, profile, env as well