mkdir -p ~/zsh/Completion
touch ~/zsh/Completion/dummy
fpath=(~/zsh/Completion $fpath)
autoload -U ~/zsh/Completion/*(:t)
# autoload -U compinit && compinit

generate-complete-function/ruby/optparse () {
    local cmpl
    cmpl=~/zsh/Completion/_`basename $1`
    existp=`[ -f $cmpl ]; echo $?`
    ruby -r$ZSH/../ruby/zshcomplete.rb $1 > $cmpl
    if [ $existp = 0 ]; then
        reload-complete-functions
    else
        compinit
    fi
}

reload-complete-functions() {
    local f
    f=(~/zsh/Completion/*(.))
    unfunction $f:t 2> /dev/null
    autoload -U $f:t
}