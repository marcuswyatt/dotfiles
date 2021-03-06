# ls colors
autoload colors; colors;
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# Enable ls colors
if [ "$DISABLE_LS_COLORS" != "true" ]
then
  # Find the option for using colors in ls, depending on the version: Linux or BSD
  ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
fi

setopt multios
setopt cdablevarS
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep

if [[ x$WINDOW != x ]]
then
    SCREEN_NO="%B$WINDOW%b "
else
    SCREEN_NO=""
fi

# Apply theming defaults
PS1="%n@%m:%~%# "

# git theming default: Variables for theming the git info prompt
THEME_PROMPT_PREFIX="("             # Prefix at the very beginning of the prompt, before the branch name
THEME_PROMPT_SUFFIX=")"             # At the very end of the prompt
THEME_PROMPT_DIRTY="*"              # Text to display if the branch is dirty
THEME_PROMPT_CLEAN=""               # Text to display if the branch is clean

# Setup the prompt with pretty colors
setopt prompt_subst

# Prompt Themes
# autoload -U promptinit && promptinit

# Load the theme
source "$ZSH/themes/$THEME.zsh"