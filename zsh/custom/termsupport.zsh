case "$TERM" in
  xterm*|rxvt*)
    preexec () {
      # print -Pn "\e]0;%n@%m: $1\a"  # xterm
      print -Pn "\e]0;%n: $1\a"  # xterm
    }
    precmd () {
      # print -Pn "\e]0;%n@%m: %~\a"  # xterm
      print -Pn "\e]0;%n: %~\a"  # xterm
    }
    ;;
  screen*)
    preexec () {
      local CMD=${1[(wr)^(*=*|sudo|ssh|-*)]}
      echo -ne "\ek$CMD\e\\"
      print -Pn "\e]0;%n@%m: $1\a"  # xterm
    }
    precmd () {
      echo -ne "\ekzsh\e\\"
      print -Pn "\e]0;%n@%m: %~\a"  # xterm
    }
    ;;
esac