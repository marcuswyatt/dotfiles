echo "Looking for an existing bash config..."
if [ -f ~/.bash_rc ] || [ -h ~/.bash_rc ]
then
  echo "Found ~/.bash_rc, Backing up to ~/.bash_rc.backup";
  cp ~/.bash_rc ~/.bash_rc.backup;
  rm ~/.bash_rc;
fi

echo "Copying your current PATH and adding it to the ./private/paths.bash file"
if [[ -e ./private/paths.bash  ]]; then
  touch ./private/paths.bash
  echo "export PATH=$PATH" >> ./private/paths.bash
fi

# Path to the bash configuration.
BASH=/Volumes/Data/Marcus/Personal/dotfiles/bash

echo "Create symlink for all the bash files (bashlogin, bashlogout, bashprofile, bashenv, bashrc)"
for bashfile in $BASH/*.bash; do
  ln -sF $bashfile $HOME/.`basename $bashfile .bash`
done

echo "Time to change your default shell to bash!"
chsh -s /bin/bash

echo "Hooray! Bash has been installed."
/bin/bash
source $HOME/.bashrc
