# Initializes My Zsh

# Add a function path
fpath=($ZSH/functions $fpath)

# Load all the base lib config files
for config_file ($ZSH/lib/*.zsh) source $config_file

# Load all of your custom configurations from custom/
for config_file ($ZSH/custom/*.zsh) source $config_file

# Load all of your private configurations from private/
for config_file ($ZSH/private/*.zsh) source $config_file
