# Apply theming defaults
PS1="\$(rvm_prompt) $PS1"
RPS1=$'Ruby v$(rvm_prompt)'

PROMPT='$(rvm_prompt) %{$fg_bold[cyan]%}$(scm)$(git_prompt_info || svn_prompt_info)%(?,,%{${fg_bold[white]}%}[%?]%{$reset_color%} )%{$fg[yellow]%}➜%{$reset_color%} '

RPROMPT='%{$fg_bold[green]%}%~%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=")%{$fg[red]%} ✘%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=")%{$fg_bold[green]%} ✔%{$reset_color%}"
