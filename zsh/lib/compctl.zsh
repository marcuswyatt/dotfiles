# compctl Examples
# The 'old' style of completion.
# It's got quite a lot of fans, because it is a lot quicker than the new system.
# Here are a few examples, on how you can configure this system:

# simple completions
# complete only dirs (or symlinks to dirs in some cases) for certain commands
# compctl -g '*(/)' rmdir dircmp
# compctl -g '*(-/)' cd chdir dirs pushd

# hosts completion for a few commands
# compctl -k hosts ftp lftp ncftp ssh w3m lynx links elinks nc telnet rlogin host
# compctl -k hosts -P '@' finger

# manpage comletion
# man_glob () {
#   local a
#   read -cA a
#   if [[ $a[2] = -s ]] then
#   reply=( ${^manpath}/man$a[3]/$1*$2(N:t:r) )
#   else
#   reply=( ${^manpath}/man*/$1*$2(N:t:r) )
#   fi
# }
# compctl -K man_glob -x 'C[-1,-P]' -m - 'R[-*l*,;]' -g '*.(man|[0-9nlpo](|[a-z]))' + -g '*(-/)' -- man

# completion for some builtins
# compctl -z -P '%' bg
# compctl -j -P '%' fg jobs disown
# compctl -j -P '%' + -s '`ps -x | tail +2 | cut -c1-5`' wait
# compctl -A shift
# compctl -c type whence where which
# compctl -m -x 'W[1,-*d*]' -n - 'W[1,-*a*]' -a - 'W[1,-*f*]' -F -- unhash
# compctl -m -q -S '=' -x 'W[1,-*d*] n[1,=]' -g '*(-/)' - 'W[1,-*d*]' -n -q -S '=' - 'n[1,=]' -g '*(*)' -- hash
# compctl -F functions unfunction
# compctl -k '(al dc dl do le up al bl cd ce cl cr dc dl do ho is le ma nd nl se so up)' echotc
# compctl -a unalias
# compctl -v getln getopts read unset vared
# compctl -v -S '=' -q declare export integer local readonly typeset
# compctl -eB -x 'p[1] s[-]' -k '(a f m r)' - 'C[1,-*a*]' -ea - 'C[1,-*f*]' -eF - 'C[-1,-*r*]' -ew -- disable
# compctl -dB -x 'p[1] s[-]' -k '(a f m r)' - 'C[1,-*a*]' -da - 'C[1,-*f*]' -dF - 'C[-1,-*r*]' -dw -- enable
# compctl -k "(${(j: :)${(f)$(limit)}%% *})" limit unlimit
# compctl -l '' -x 'p[1]' -f -- . source
# compctl -s '$(setopt 2>/dev/null)' + -o + -x 's[no]' -o -- unsetopt
# compctl -s '$(unsetopt)' + -o + -x 's[no]' -o -- setopt
# compctl -s '${^fpath}/*(N:t)' autoload
# compctl -b bindkey
# compctl -c -x 'C[-1,-*k]' -A - 'C[-1,-*K]' -F -- compctl
# compctl -x 'C[-1,-*e]' -c - 'C[-1,-[ARWI]##]' -f -- fc
# compctl -x 'p[1]' - 'p[2,-1]' -l '' -- sched
# compctl -x 'C[-1,[+-]o]' -o - 'c[-1,-A]' -A -- set

# Load all the custom compctl completions
for completion ($ZSH/lib/compctl/*.zsh) source $completion