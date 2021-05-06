#!/bin/sh

echo "Setting up your Mac Homee..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
# brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# TEMP_PATH_FOR_THEME=/tmp/spaceship-theme
# rm -rf $TEMP_PATH_FOR_THEME
# mkdir $TEMP_PATH_FOR_THEME
# npm install -g spaceship-zsh-theme

# Install Composer
# curl -sS https://getcomposer.org/installer | php
# mv composer.phar /usr/local/bin/composer

# Install global Composer packages
# /usr/local/bin/composer global require laravel/installer laravel/lumen-installer laravel/spark-installer laravel/valet tightenco/jigsaw

# Install Laravel Valet
# $HOME/.composer/vendor/bin/valet install

# Install global NPM packages
# npm install --global yarn gulp eslint prettier # might add (now)

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
# mkdir $HOME/Sites

# Remove Last Login Message from Terminal
touch ~/.hushlogin

# Symlink the Mackup config file to the home directory
# ln -s ./.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences
# We will run this last because this will reload the shell
# source .macos
