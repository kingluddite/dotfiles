# zmodload zsh/zprof
# uncomment this to test zsh speed
# Path to your oh-my-zsh installation.
#timer=$(($(gdate +%s%N)/1000000))
export PATH=/opt/homebrew/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
export FZF_BASE="$HOME/.fzf"
ZSH_THEME="cobalt2"

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

export PATH=/opt/homebrew/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/opt/mongodb-community@4.0/bin
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"


# add my local scripts
export PATH=$HOME/bin:$PATH

# add mysql to zshrc
export PATH=/usr/local/mysql/bin:$PATH

plugins=(vi-mode)

# z - frecent (track where you last were)
. $HOME/z.sh

# --- Source
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
source $HOME/.functions

# vi-escape delays - https://www.johnhawthorn.com/2012/09/vi-escape-delays/
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
bindkey '`'  autosuggest-accept # If you want to accept and type out all of what autosuggest suggests just type `

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

autoload -Uz compinit
# case insensitive path-completion 
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 

function gi() { curl -sLw n https://www.gitignore.io/api/$@ ;}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zprof # bottom of .zshrc for speed
export PATH="/usr/local/opt/node@12/bin:$PATH"
# Sublime Text can now use subl
export PATH=$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin
# Makes green/red highlighting work
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"

fi
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
