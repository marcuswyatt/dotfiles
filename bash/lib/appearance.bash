#!/bin/bash

# git theming default: Variables for theming the git info prompt
THEME_PROMPT_PREFIX="("             # Prefix at the very beginning of the prompt, before the branch name
THEME_PROMPT_SUFFIX=")"             # At the very end of the prompt
THEME_PROMPT_DIRTY="*"              # Text to display if the branch is dirty
THEME_PROMPT_CLEAN=""               # Text to display if the branch is clean


# Load the theme
source "$BASH/themes/$THEME.bash"