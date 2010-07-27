# Initializes My Zsh

# Add a function path
fpath=($ZSH/functions $fpath)

# Load all the shared config files
for shared_file ($ZSH/../shell/**/*.sh) source $shared_file

# Load all the base lib config files
for lib_file ($ZSH/lib/*.zsh) source $lib_file

# Load all of your custom configurations from custom/
for custom_file ($ZSH/custom/*.zsh) source $custom_file

# Load all of your private configurations from private/
for private_file ($ZSH/private/*.zsh) source $private_file
