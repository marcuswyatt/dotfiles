export MANPATH=/opt/local/share/man:$MANPATH
export MANPATH=/usr/local/man:$PATH
export MANPATH=/usr/local/git/man:$PATH

export INFOPATH=$INFOPATH:/opt/local/share/info

export MAILCHECK=-1

export ARCHFLAGS="-arch x86_64"     # So we don't have to specify in Snow Leopard when building native extensions

export CDPATH=:$HOME                # add HOME to CDPATH string

export AUTOFEATURE=true             # Set so that autospec will run cucumber stories
export RSPEC=true

export USE_PGXS=1                   # PostgreSQL pgTAP
export PGOPTIONS='-c client_min_messages=WARNING' # Turn off PostgreSQL messages

export EDITOR='vim'
export SVN_EDITOR='vim'
export GIT_EDITOR='vim'
export GEM_OPEN_EDITOR='vim'
# export LESSEDIT='mate -l %lm %f'