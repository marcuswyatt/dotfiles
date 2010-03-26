#!/bin/sh

# Initializes My Bash

# Load all the shared config files
# for shared_file ($BASH/../shell/lib/*.sh) source $shared_file
for shared_file in $BASH/../shell/lib/*.sh; do
  echo $shared_file
  source $shared_file
done

# Load all the base lib config files
for config_file in $BASH/lib/*.bash; do
  echo $config_file
  source $config_file
done

# Load all of your custom configurations from custom/
for config_file in $BASH/custom/*.bash; do
  echo $config_file
  source $config_file
done

# Load all of your private configurations from private/
for config_file in $BASH/private/*.bash; do
  echo $config_file
  source $config_file
done
