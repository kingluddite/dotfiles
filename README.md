# Instructions
1. git clone dotfiles repo to your $HOME (~) directory (5 seconds)
2. install xcode tools - `$ xcode-select --install` (approx 5min)
**note** save dotfiles to $HOME
**note** If you run into file permission errors, give file execute permission `chmod 775 install.sh`

3. Run the install file
* `$ ./install.sh` (5 minutes)
  * This will install homebrew and cask
  * This will install all your macos defaults
4. Install the apps you need for class
*  `$ brew bundle`

5.
*  Then run `$ ./makesymlinks.sh` (inside `dotfiles`)
*  Then install Sublime
*  might have to manually install package control and restart sublime text

## Setup Iterm
* This will add my iterm2 preferences
$ rm ~/Library/Preferences/com.googlecode.iterm2.plist
$ ln -s ~/dotfiles/init/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist

* oh-my-zsh
  - We will use the spaceship theme
  - install with `$ npm install -g spaceship-zsh-theme`
  - change the theme inside .zshrc

`$ cd ~/dotfiles`
`$ vim vimrc`
`:PluginInstall`

install latest vim - `$ brew install vim --override-system-vi`




