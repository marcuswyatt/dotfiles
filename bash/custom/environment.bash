#!/bin/bash

export HISTSIZE=3000
export HISTFILESIZE=3000
export EDITOR='mate -w'

export RI="--no-home --no-gems --no-site --format ansi -T"
export PGDATA=/opt/local/var/db/postgres
export LC_CTYPE=en_US.UTF-8
export TERM=xterm-color             # set the terminal type
# export CDPATH=:$HOME              # add HOME to CDPATH string
export GEMDIR=`gem env gemdir`
export GEM_HOME=/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/gems/1.8
export USE_PGXS=1                   # PostgreSQL pgTAP
EVENT_NOKQUEUE=1                    # For memcached

# export AUTOFEATURE=true           # Set so that autospec will run cucumber stories
# export CUCUMBER_COLORS=passed=white
# export CUCUMBER_COLORS=passed=white,bold:passed_param=white,bold,underline
export CUCUMBER_COLORS=pending_param=magenta:failed_param=magenta:passed_param=magenta:skipped_param=magenta

export VIMINIT='set ai aw'        # set vim options
