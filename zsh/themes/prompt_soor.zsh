# -*- mode: sh; -*-
# soor prompt theme

prompt_soor_help () {
  cat <<'EOF'
This prompt is configurable via styles:

  Context: :prompt:soor

  Colors (in zsh/terminfo value):
    user-color - the color for user@host. defaults to 'green'
    root-color - the color for the hostname for root. defaults to 'red'
    prompt-color - the color for everything else. defaults to 'blue'

  Path type:
    path - possible values:
      ratio - use COLUMNS/ratio to clip the path. Default.
      fixed - use a fixed maximum lenght.
      subdir - clip by number of subdirectories.
      full - show the full path

  Path lenght styles:
    ratio - the ratio for the 'ratio' path style, funnily enough.
            default to 6.
    length - the maximin lenght for the 'fixed' path style.
             defaults to 20
    subdir - the number of subdirs to show for the 'subdir' path style.
             defaults to 3.

  You can set styles in the current terminal to test things out, values
  will be updated.

EOF
}

prompt_soor_setup () {
    setopt noxtrace localoptions

    precmd () {

  local p_full
  local p_tchars p_temp p_done p_last i
  local maxlength ratio
  local prompt_color
  local user_color
  local root_color
  local path_style

  zstyle -s :prompt:soor prompt-color prompt_color
  prompt_color=${prompt_color:-'blue'}
  zstyle -s :prompt:soor user-color user_color
  user_color=${user_color:-'green'}
  zstyle -s :prompt:soor root-color root_color
  root_color=${root_color:-'red'}

  [[ -z $(functions zsh/terminfo) ]] && autoload -Uz zsh/terminfo

  if [[ "$terminfo[colors]" -ge 8 ]]; then
      if [[ "$EUID" = "0" ]] || [[ "$USER" = 'root' ]]
      then
    base_prompt="%{$fg_bold[$root_color]%}%m%{$fg_bold[$prompt_color]%} "
      else
    base_prompt="%{$fg_bold[$user_color]%}%n@%m%{$fg_bold[$prompt_color]%} "
      fi
      post_prompt="%{$reset_color%}"
  else
      base_prompt="%n@%m "
      post_prompt=""
  fi

  if zstyle -t :prompt:soor path full ratio fixed subdir; then
      zstyle -s :prompt:soor path path_style
  else
      path_style='ratio'
  fi

  case "${path_style}" in
      ratio)
    zstyle -s :prompt:soor ratio ratio
    ratio=${ratio:-6}
    maxlength=$(( ${COLUMNS} / ${ratio} ))
    ;;
      fixed)
    zstyle -s :prompt:soor length maxlength
    maxlength=${maxlength:-20}
    ;;
      subdir)
    zstyle -s :prompt:soor subdir maxlength
    maxlength=${maxlength:-3}
    ;;
  esac

  case "${path_style}" in
      full)
    path_prompt=$(print -P %~)
    ;;
      subdir)
    path_prompt=$(print -P "%($(( ${maxlength} + 1 ))~|..|)%${maxlength}~")
    ;;
      ratio|fixed)
    path_prompt=$(print -P %~)
    if (( ${#path_prompt} > ${maxlength} )); then
        p_tchars='../'
        p_done=${path_prompt}
        for (( i=1 ; ; ++i )); do
      p_temp=$(print -P %${i}~)
      if (( ( ${#p_temp} + ${#p_tchars} ) < ${maxlength} )); then
          p_done=${p_temp}
      else
          break
      fi
        done
        path_prompt=${p_tchars}${p_done}
    fi
    ;;
  esac

  PS1="$base_prompt$path_prompt %# $post_prompt"
  PS2="$base_prompt$path_prompt %_> $post_prompt"
  PS3="$base_prompt$path_prompt ?# $post_prompt"
    }

    preexec () { }
}

prompt_soor_setup