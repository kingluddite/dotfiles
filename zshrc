# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cobalt2"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo alias-tips zsh-syntax-highlighting zsh-autosuggestions zsh-syntax-highlighting)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

#PHP_VERSION=`ls /Applications/MAMP/bin/php/ | sort -n | tail -1`
#export PATH=/Applications/MAMP/bin/php/${PHP_VERSION}/bin:$PATH
# MAMP and MYSQL
#export PATH="/Applications/MAMP/Library/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# autosuggest for zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# =================
# School Aliases
# =================
# emerging tech
# alias et='cd ~/Documents/dev/classes/gwda313/2016/summer/'

# =================
# Node Aliases
# =================
alias kll='kill -9'
alias fpid3='lsof -i:3000'
alias fpid5='lsof -i:5858'

# =================
# Workflow Aliases
# =================
alias md='mkdir'
## (tip) falias + "word to search for"
alias falias='alias | grep ' # search all aliases (Jacob!)
# List file information
alias ls='ls -laF'  # show slashes for directories
alias ll='ls -la'   # long list format (inc hidden files/unit size)
alias h='history'   # lists your previously entered commands

# =================
# dotfiles Aliases
# =================
alias dotf='cd ~/dotfiles'

# =================
# Server Aliases
# =================
# alias editVhosts='sublime /etc/apache2/extra/httpd-vhosts.conf'
# alias restartApache="sudo apachectl restart"
# alias editHosts='sublime /etc/hosts'

# =================
# Config Aliases
# =================
alias bash='sublime ~/.bash_profile'
alias refrash='source ~/.bash_profile'

# =================
# Navigation Aliases
# =================
alias notes='cd ~/Documents/dev/web-dev-notes' # My awesome notes!
alias sites='cd ~/Sites/'
alias desk='cd ~/Desktop'
alias dev='cd ~/Documents/dev'
alias ..='cd ../'                           # Go back 1 directory level
alias b='cd ..'                             # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

# =================
# File/Folder Manipulation Aliases
# =================
# confirm before executing and be verbose
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'

# =================
# Mongo Aliases
# =================
# Kill Mongo process when it gets hung up
alias monkill='ps aux | grep mongod'
alias fm='ps aux | grep mongo'

# =================
# OSX Aliases
# =================
# Hide/show all desktop icons (useful when presenting)
alias hide_desktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias show_desktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Hide/show hidden files in Finder
alias hide_files="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias show_files="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"

# ================
# Application Aliases
# ================
alias sop='sublime .'
alias db='cd ~/Dropbox'
alias chrome='open -a "Google Chrome"'
alias phub='hub browse kingluddite'
alias vvv='cd ~/Documents/dev/vagrant-local'   # VVV WordPress
alias sasswatch='sass --watch scss:css'

# ================
# Exports (History)
# ================
# http://jorge.fbarr.net/2011/03/24/making-your-bash-history-more-efficient/
# Larger bash history (allow 32Â³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE

# don't put duplicate lines in the history.
export HISTCONTROL=ignoredups

# ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# Make some commands not show up in history
export HISTIGNORE="h"

# ====================
# Git Aliases
# ====================
alias gs='git status'
alias gap='git add -p'
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gob='git checkout -b '
alias gk='gitk --all&'
alias gx='gitx --all'
alias glog='git log --pretty=oneline --abbrev-commit'
alias gitl='git log --pretty=oneline'
alias lgl='git log --oneline --decorate'
alias up='git pull upstream master'
# when I mispell git commands the following 2 commands help
alias got='git '
alias get='git '

alias zash='sublime ~/.zshrc'
alias bhswp='cd ~/Sites/bhs-wp/wp-content/themes/bhs'
alias bhszz='cd ~/Sites/bhs-wp-zz/wp-content/themes/bhs'
alias zfrash='source ~/.zshrc'

# Key Bindings
bindkey '^u' autosuggest-accept
bindkey '`' autosuggest-accept
