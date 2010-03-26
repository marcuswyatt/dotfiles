#!/bin/bash

# Apply theming defaults
# PS1="\$(rvm_prompt) $PS1"
# RPS1=$'Ruby v$(rvm_prompt)'

# echo ""
PROMPT='[${BRIGHT_RED}v$(rvm_prompt)${RESET}] ${BRIGHT_CYAN}$(scm)$(git_prompt_info || svn_prompt_info)%(?,,%{${BRIGHT_WHITE}%}[%?]%{${RESET} )%{${BRIGHT_YELLOW}}➜%{${RESET}} '

# RPROMPT='%{$fg_bold[green]%}%~%{$reset_color%}'

THEME_PROMPT_PREFIX="("
THEME_PROMPT_SUFFIX="${RESET} "
THEME_PROMPT_DIRTY=")${BRIGHT_RED} ✘${RESET}"
THEME_PROMPT_CLEAN=")${BRIGHT_GREEN} ✔${RESET}"


# export PS1='\[\033[01;34m\]\h \[\033[01;32m\]\W $(__git_ps1 "(%s)")$ \[\033[00m\] '
# export PS1="\n${BRIGHT_BLACK}\t:${BRIGHT_RED}\$(__git_ps1 '(%s)')\$(parse_svn_branch) ${BRIGHT_GREEN}\w${BRIGHT_WHITE} \$ \n→ '"
# export PS1="${BRIGHT_BLACK}\t:${BRIGHT_RED}\$(git_prompt_info || svn_prompt_info) ${BRIGHT_GREEN}\w${BRIGHT_WHITE} \$\n\r→ '"
