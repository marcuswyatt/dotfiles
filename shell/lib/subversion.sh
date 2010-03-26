# Varables for themeing the svn info prompt:
# THEME_PROMPT_PREFIX - Prefix at the very beginning of the prompt, before the branch name
# THEME_PROMPT_SUFFIX - At the very end of the prompt
# THEME_PROMPT_DIRTY  - Text to display if the branch is dirty
# THEME_PROMPT_CLEAN  - Text to display if the branch is clean
# THEME_PROMPT_DIRTY_SYMBOL   - Symbol to display if branch is dirty
# THEME_PROMPT_CLEAN_SYMBOL   - Symbol to display if the branch is clean

# THEME_PROMPT_PREFIX="♲ svn:("
# THEME_PROMPT_DIRTY="%{$fg_bold[red]%}"
# THEME_PROMPT_CLEAN="%{$fg_bold[green]%}"
# THEME_PROMPT_SUFFIX="%{$reset_color%}"
# THEME_PROMPT_DIRTY_SYMBOL=") ✘"
# THEME_PROMPT_CLEAN_SYMBOL=") ✔"

# get the name of the branch we are on
# function svn_prompt_info() {
#   ref=$(svn info 2>/dev/null | grep '^URL:' | egrep -o '(tags|branches)/[^/]+|trunk' | egrep -o '[^/]+$') || return
#   echo "$(parse_svn_dirty)$THEME_PROMPT_PREFIX${ref}$(show_svn_dirty_symbol)$THEME_PROMPT_SUFFIX"
# }

function svn_prompt_info() {
  ref=$(svn info 2>/dev/null | grep '^URL:' | egrep -o '(tags|branches)/[^/]+|trunk' | egrep -o '[^/]+$') || return
  echo "$THEME_PROMPT_PREFIX${ref}$(parse_svn_dirty)$THEME_PROMPT_SUFFIX"
}

function svn_repo () {
  if [[ $(svn status 2> /dev/null | grep 'M') != "" ]]; then
    echo "svn:"
  fi
}


parse_svn_dirty () {
  if [[ $(svn status | grep 'M') != "" ]]; then
    echo "$THEME_PROMPT_DIRTY"
  else
    echo "$THEME_PROMPT_CLEAN"
  fi
}

show_svn_dirty_symbol () {
  if [[ $(svn status | grep 'M') != "" ]]; then
    echo "$THEME_PROMPT_DIRTY_SYMBOL"
  else
    echo "$THEME_PROMPT_CLEAN_SYMBOL"
  fi
}