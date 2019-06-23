#modload zsh/zprof
# Path to your oh-my-zsh installation.
#timer=$(($(gdate +%s%N)/1000000)) 

export ZSH=$HOME/.oh-my-zsh

# now=$(($(gdate +%s%N)/1000000))
# elapsed=$(($now-$timer))
# echo $elapsed":" $plugin
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cobalt2"
# ZSH_THEME="iguchi"
# SPACESHIP_PROMPT_SYMBOL=">"
# SPACESHIP_PACKAGE_SHOW=false
# SPACESHIP_BATTERY_SHOW=false
# SPACESHIP_BATTERY_ALWAYS_SHOW=false

# Android stuff
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools

# --- Plugins
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(sudo alias-tips zsh-autosuggestions osx zsh-syntax-highlighting)
# plugins=(sudo alias-tips osx zsh-syntax-highlighting)

# --- Customize it!
# Would you like to use another custom folder than $ZSH/custom?
# echo $ZSH_CUSTOM (shows where it is)
# ZSH_CUSTOM=$HOME/dotfiles/custom/themes/

# User configuration

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# export PATH=$PATH:/usr/local/lib/node_modules
# export MANPATH="/usr/local/man:$MANPATH"
# this is the root folder where all globally installed node packages will  go
# export NPM_PACKAGES="/usr/local/npm_packages"
# export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
# add to PATH
# export PATH="$NPM_PACKAGES/bin:$PATH"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

## MAMP stuff
# PHP_VERSION=`ls /Applications/MAMP/bin/php/ | sort -n | tail -1`
# export PATH=/Applications/MAMP/bin/php/${PHP_VERSION}/bin:$PATH
# MAMP and MYSQL
# export PATH="/Applications/MAMP/Library/bin:$PATH"

plugins=(vi-mode zsh-autosuggestions)

# z - frecent (track where you last were)
. $HOME/z.sh

# --- Source
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
source $HOME/.functions

export KEYTIMEOUT=1

# VI Mode
# navigate zsh tab completion
# zstyle ':completion:*' menu select
# zmodload zsh/complist

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey -v
bindkey -M viins ‘jk’ vi-cmd-mode # jk takes you to cmd mode!
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
# bindkey '^u' autosuggest-accept
bindkey '`'  autosuggest-accept

# function zle-line-init zle-keymap-select {
#     VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
#     RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
#     zle reset-prompt
# }

# function parse_git_branch() {
#   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
# }

# zle -N zle-line-init
# zle -N zle-keymap-select

prompt_dir() {
    prompt_segment blue black "%$(( $COLUMNS - 61 ))<...<%3~%<<"
}
if [ "$_Z_NO_RESOLVE_SYMLINKS" ]; then
    _z_precmd() {
        (_z --add "${PWD:a}" &)
		: $RANDOM
    }
else
    _z_precmd() {
        (_z --add "${PWD:A}" &)
		: $RANDOM
    }
fi

# autoload -Uz compinit
# typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
# if [ $(date +'%j') != $updated_at ]; then
#   compinit -i
# else
#   compinit -C -i
# fi
#
# zmodload -i zsh/complist

#zprof
