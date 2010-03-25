# -a, --archive               archive mode
# -v, --verbose               increase verbosity
# -z, --compress              compress file data during the transfer
# -r, --recursive             This tells rsync to copy directories recursively.
# -u, --update                skip files that are newer on the receiver
alias rsync='rsync -aruvz --exclude '.svn' --progress '

# Use OS X version of SSH with agent forwarding
alias ssh='/usr/bin/ssh -A'
alias scp='/usr/bin/scp'
alias sftp='/usr/bin/sftp'

# -N  Causes  a  line  number to be displayed at the beginning of each line in the display.
alias less='less -N'

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"