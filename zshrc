# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cobalt2"
# SPACESHIP_PROMPT_SYMBOL=">"
# SPACESHIP_PACKAGE_SHOW=false
# SPACESHIP_BATTERY_SHOW=false
# SPACESHIP_BATTERY_ALWAYS_SHOW=false

# --- Plugins
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo alias-tips sh-autosuggestions zsh-syntax-highlighting)

# --- Customize it!
# Would you like to use another custom folder than $ZSH/custom?
# echo $ZSH_CUSTOM (shows where it is)
# ZSH_CUSTOM=$HOME/dotfiles/custom/themes/

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

## MAMP stuff
#PHP_VERSION=`ls /Applications/MAMP/bin/php/ | sort -n | tail -1`
#export PATH=/Applications/MAMP/bin/php/${PHP_VERSION}/bin:$PATH
# MAMP and MYSQL
#export PATH="/Applications/MAMP/Library/bin:$PATH"

# --- not sure where this goes yet???
# z - frecent (made up word but this is cool!)
. $HOME/z.sh

# --- Source
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
source $HOME/.functions

# autosuggest for zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

## Your default theme (not sure about this yet)
# source "$HOME/dotfiles/custom/themes/spaceship.zsh-theme" # our theme
# source "$HOME/dotfiles/custom/themes/cobalt2.zsh-theme" # our theme

# Key Bindings
bindkey '^u' autosuggest-accept
bindkey '`' autosuggest-accept

