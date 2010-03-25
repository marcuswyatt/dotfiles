#
# zshrc
# -------
#   read after zprofile, if the shell is an interactive shell
#
# .zshrc
# -------
#   read after zprofile, if the shell is an interactive shell
#
# echo 'zshrc'

# Path to your oh-my-zsh configuration.
export ZSH=/Volumes/Data/Marcus/Personal/dotfiles/zsh

# Set to the name theme to load.
export ZSH_THEME="marcus-wyatt"

export MANPATH=/opt/local/share/man:/usr/local/man:/usr/local/git/man:$MANPATH
export INFOPATH=$INFOPATH:/opt/local/share/info
export MAILCHECK=-1
export ARCHFLAGS="-arch x86_64"     # So we don't have to specify in Snow Leopard when building native extensions
export CDPATH=:$HOME                # add HOME to CDPATH string

export AUTOFEATURE=true             # Set so that autospec will run cucumber stories
export RSPEC=true

export USE_PGXS=1                   # PostgreSQL pgTAP
export PGOPTIONS='-c client_min_messages=WARNING' # Turn off PostgreSQL messages

export SVN_EDITOR='vim'
export GIT_EDITOR='vim'
export EDITOR='vim'
export EDITOR='vim'
export GEM_OPEN_EDITOR='vim'
# export LESSEDIT='mate -l %lm %f'

source $ZSH/zsh.sh