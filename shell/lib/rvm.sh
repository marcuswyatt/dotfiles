#!/bin/sh

# Ruby Version Manager
if [ -s ~/.rvm/scripts/rvm ] ; then

  # Prompt function. Return the full version string.
  function ruby_prompt_version_full {
    version=$(
      rvm info |
      grep -m 1 'full_version' |
      sed 's/^.*full_version:[ ]*//' |
      sed 's/["]//g'
    ) || return
    echo $version
  }

  # Prompt function. Return just the version number.
  function ruby_prompt_version {
    version=$(
      rvm info |
      grep -m 1 'version' |
      sed 's/^.*version:[ ]*//' |
      sed 's/["]//g'
    ) || return
    echo $version
  }

  function ruby_version () {
    version=$(
      rvm info |
      grep ruby -A 8 |
      grep -m 1 'version' |
      sed 's/^.*version:[ ]*//' |
      sed 's/["]//g'
    ) || return
    echo $version
  }

  function rvm_prompt () {

    ruby_string=$(ruby -v)

    if [[ $ruby_string == *1.8.7* ]] ; then
      version="$(echo $ruby_string | awk -F' ' '{print $2}')"
      patchlevel="p$(echo $ruby_string | awk -F' ' '{print $5}' | sed 's/[)]//g')"
    fi

    if [[ $ruby_string == *1.9.1* ]] ; then
      ruby_string=$(dirname "$(which ruby 2>/dev/null)" | xargs dirname | xargs basename)
      version="$(echo $ruby_string | awk -F'-' '{print $2}')"
      patchlevel=$(echo $ruby_string | awk -F'-' '{print $3}')
    fi

    if [[ $ruby_string == *1.9.2* ]] ; then
      ruby_string=$(dirname "$(which ruby 2>/dev/null)" | xargs dirname | xargs basename)
      version="$(echo $ruby_string | awk -F'-' '{print $2}')"
      patchlevel=$(echo $ruby_string | awk -F'-' '{print $3}')
    fi

    echo "$version $patchlevel"
  }

fi # Ruby Version Manager