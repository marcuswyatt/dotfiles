#!bin/bash

# alias java=/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Commands/java

#*nix commands
# alias ciao='sudo shutdown -h now'   # close down the system at a given time NOW
# alias df='df -h'                    # display free disk space in human readable format
# alias cp='cp -i'                    # interactive copy files

#######
# rm  #
#######
# alias rm='rm -i'                    # interactive remove file hierarchy
# alias rmf='rm -f'
# alias rmb='rm -f *~'
# alias del='mv \!* ~/.Trash'         # delete a file or folder

#######
# ls  #
#######
# alias ls='ls -a'
# alias lsg='ls -G'                   # G -> Enable colorized output.
# alias l.='ls -d .* --color=tty'     # Directories not searched recursively
# alias la='ls -alh'                  # All, Listed in long format and human readable
# alias lb='ls -B'                    # Force printing of non-printable characters
# alias lt='ls -ltrh | tail'          # All, long format, Sorted by time modified descending in human readable, paged.

########
# grep #
########
# alias grep="grep --color=auto"
# alias gr='GREP_COLOR="1;4;34" grep --color=always --exclude=*~ --exclude=*.svn* --exclude=*.tmp --exclude=entries'
# alias grr='gr -r'

# alias so='source ~/.bashrc'
# alias soo='source'
#alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
# alias s="sudo"

# alias diff='diff -u'                # toggle unified output format
# alias mv='mv -i'                    # interactive move or rename
# alias l='less'
# alias lr='less -r'
# alias h='history'

# alias c='clear'                     # clear the terminal screen
# alias cl='clear; l'                 #
# alias cls='clear; ls'

# alias ch='chmod 755 '
# alias tt="testrb"
# alias t='thor'
# alias p='perl'
# alias sn='screen'
# alias qt="open -a 'QuickTime Player'"
# alias mplayer="open -a 'MPlayer OSX'"
# alias starter="sudo SystemStarter"
# alias x2='xmms2'
# alias lni='lightning-install'

#commands that could be functions
# alias f#='ls |wc -l'
# alias w2l='tr -d 015 < $1 > $2'
# dos2nix="perl -pi.bak -we 's/\r/\n/g'"

### Personal (You'll need to adjust paths and install applications as needed) ###

#######
# vim #
#######
# alias e='vim'
# alias ee='vim -u NONE'

#############
# memcached #
#############
# alias mem='memcached -d -l 127.0.0.1 -p 11211 -m 256'

############
# postgres #
############

#########
# mysql #
#########
# alias mydump='mysqldump -p -A'
# alias sqllog='sudo ~/trace_sqllog `pidof mysqld`'

############
# rubygems #
############
# alias gs='gem search -r'          # Display all gems whose name contains STRING
# alias sgi='sudo gem install'      # Install a gem into the local repository
# alias sgu='sudo gem uninstall'    # Uninstall gems from the local repository
# alias sgu='gem build'             # Build a gem from a gemspec
# alias sgu='gem cert'              # Manage RubyGems certificates and signing settings
# alias sgu='gem check'             # Check installed gems
# alias sgu='gem cleanup'           # Clean up old versions of installed gems in the local repository
# alias sgu='gem contents'          # Display the contents of the installed gems
# alias sgu='gem dependency'        # Show the dependencies of an installed gem
# alias sgu='gem environment'       # Display information about the RubyGems environment
# alias sgu='gem fetch'             # Download a gem and place it in the current directory
# alias sgu='gem generate_index'    # Generates the index files for a gem server directory
# alias sgu='gem help'              # Provide help on the 'gem' command
# alias sgu='gem list'              # Display gems whose name starts with STRING
# alias sgu='gem lock'              # Generate a lockdown list of gems
# alias sgu='gem mirror'            # Mirror a gem repository
# alias sgu='gem outdated'          # Display all gems that need updates
# alias sgu='gem pristine'          # Restores installed gems to pristine condition from files located in the gem cache
# alias sgu='gem query'             # Query gem information in local or remote repositories
# alias sgu='gem rdoc'              # Generates RDoc for pre-installed gems
# alias sgu='gem server'            # Documentation and gem repository HTTP server
# alias sgu='gem sources'           # Manage the sources and cache file RubyGems uses to search for gems
# alias sgu='gem specification'     # Display gem specification (in yaml)
# alias sgu='gem stale'             # List gems along with access times
# alias sgu='gem unpack'            # Unpack an installed gem to the current directory
# alias sgu='gem update'            # Update the named gems (or all installed gems) in the local repository
# alias sgu='gem which'             # Find the location of a library file you can require

#######
# SVN #
#######
# alias sup='svn up' # trust me 3 chars makes a different
# alias sstu='svn st -u' # remote repository changes
# alias scom='svn commit' # commit
# alias svnclear='find . -name .svn -print0 | xargs -0 rm -rf' # removes all .svn from directory recursively
# alias svnaddall='svn status | grep "^\?" | awk "{print \$2}" | xargs svn add' # adds all unadded files

#######
# git #
#######
# alias g='git'
# alias gad='git add'
#
# alias gbr='git branch'
# alias gbv='git branch -v'
# alias gba='git branch -a'
#
# alias gcm='git commit -a -m'
# alias gcv='git commit -v'
# alias gca='git commit -v -a'
#
# alias gco='git checkout'
# alias gcf='git config'
# alias gcl='git clone'
# alias gdf='git diff'
# alias glg='git log'
# alias grm='git rm'
# alias gst='git status'
# alias gpl='git pull'
# alias gph='git push'
# alias gmv='git mv'

# Opens up any current working directory project to it's equivalent GitHub page:
# alias ghub="open \`git config -l | grep 'remote.origin.url' | sed -En \ 's/remote.origin.url=git(@|:\/\/)github.com(:|\/)(.+)\/(.+).git/https:\/\/github.com\/\3\/\4/p'\`"

########
# RUBY #
########
# use readline, completion and require rubygems by default for irb
# alias irb='irb --simple-prompt -r irb/completion -rubygems'
# alias r='ruby'
# alias rr='ruby -rubygems'

#########
# RAILS #
#########
# alias sc='ruby script/console --irb="irb --simple-prompt -r irb/completion -rubygems"'
# alias sg='./script/generate'
# alias sp='./script/plugin'
# alias ss='./script/server'
# if [ -f ./script/server_restart ]; then
#   alias ss='./script/server_restart'
# fi

#############
# PROCESSES #
#############
# alias tu='top -o cpu'         # cpu
# alias tm='top -o vsize'       # memory
# alias psgrep='ps aux | grep'
# alias k9='kill -9'
# alias ka="killall"
