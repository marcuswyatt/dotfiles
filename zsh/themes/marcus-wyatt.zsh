THEME_PROMPT_PREFIX="$(scm)("
THEME_PROMPT_SUFFIX="%{$reset_color%} "
THEME_PROMPT_DIRTY=")%{$fg[red]%} ✘%{$reset_color%}"
THEME_PROMPT_CLEAN=")%{$fg_bold[green]%} ✔%{$reset_color%}"

# Apply theming defaults
PS1="\$(rvm_prompt) $PS1"
RPS1=$'Ruby v$(rvm_prompt)'

PROMPT='[%{$fg_bold[red]%}v$(rvm_prompt)%{$reset_color%}] %{$fg_bold[cyan]%}$(git_prompt_info || svn_prompt_info)%(?,,%{${fg_bold[white]}%}[%?]%{$reset_color%} )%{$fg[yellow]%}➜%{$reset_color%} '

RPROMPT='%{$fg_bold[green]%}%~%{$reset_color%}'
