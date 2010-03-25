# The complist module is needed to get colored completion.
# zmodload zsh/complist
zmodload -i zsh/complist

# How to turn on the "new" completion system
autoload -Uz compinit && compinit

# Enabling Caching
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Ignoring matches
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'   # ignore csv
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'            # ignore csv
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)git'   # ignore git
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#git'            # ignore git
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)svn'   # ignore svn
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#svn'            # ignore svn
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#lost+found'  # ignore lost+found

# cd will never select the parent directory (e.g.: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Fuzzy matching of completions for when you mistype them
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' \ max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# Ignore completion functions for commands you don't have:
zstyle ':completion:*:functions' ignored-patterns '_*'

# With helper functions like:
xdvi() { command xdvi ${*:-*.dvi(om[1])} }

# you can avoid having to complete at all in many cases, but if you do,
# you might want to fall into menu selection immediately and to have the
# words sorted by time:
zstyle ':completion:*:*:xdvi:*' menu yes select
zstyle ':completion:*:*:xdvi:*' file-sort time

# Process Completion
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'  force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,%cpu,%mem,user,comm -w -w -m"

# If you end up using a directory as argument, this will remove the
# trailing slash (usefull in ln)
zstyle ':completion:*' squeeze-slashes true

# Complete on history
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# If you want zsh's completion to pick up new commands in $path automatically
# comment out the next line and un-comment the following 5 lines
zstyle ':completion:::::' completer _complete _approximate

# zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle :compinstall filename '$HOME/.zshrc'

# Subscript completion
# zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Picking parameters by the existence of a special completer
# zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# Completing on the prefix
# bindkey '^i' expand-or-complete-prefix

# Using _expand before _complete
# zstyle ':completion:all-matches::::' completer _all_matches _complete
# zstyle ':completion:all-matches:*' old-matches true
# zstyle ':completion:all-matches:*' insert true
# zstyle ':completion:match-word::::' completer _all_matches _match _ignored
# zstyle ':completion:match-word:*' insert-unambiguous true
# zstyle ':completion:match-word:*' match-original both
# zle -C all-matches complete-word _generic
# zle -C match-word complete-word _generic
# bindkey '^Xx' all-matches
# bindkey '\e*' match-word

# Colorizing completion lists
# zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=$color[cyan]=$color[red]"

# users completer add lots of uninteresting user accounts, remove them
# zstyle ':completion:*:*:*:users' ignored-patterns \
#     adm apache bin daemon games gdm halt ident junkbust lp mail mailnull \
#     named news nfsnobody nobody nscd ntp operator pcap postgres radvd \
#     rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs backup  bind  \
#     dictd  gnats  identd  irc  man  messagebus  postfix  proxy  sys  www-data
# zstyle ':completion:*:functions' ignored-patterns '_*'          # Ignore completion functions
# zstyle ':completion:*:(cd|mv|cp):*' ignore-parents parent pwd    # Ignore parent directory
# zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes          # Ignore what's already in the line

# Hostnames completion (Using ~/.ssh/config)(from http://busy-bee.net/files/zsh/zshrc)
# Load known hosts file for auto-completion with ssh and scp commands
if [ -f ~/.ssh/known_hosts ]; then
  zstyle ':completion:*' hosts $( sed 's/[, ].*$//' $HOME/.ssh/known_hosts )
  zstyle ':completion:*:*:(ssh|scp):*:*' hosts `sed 's/^\([^ ,]*\).*$/\1/' ~/.ssh/known_hosts`
fi

# Load all the custom compsys completions
for completion ($ZSH/lib/compsys/*.zsh) source $completion


