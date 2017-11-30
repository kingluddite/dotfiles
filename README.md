# Instructions
1. git clone dotfiles repo to your $HOME (~) directory (5 seconds)
2. install xcode tools - `$ xcode-select --install` (approx 5min)

**notes**

* Make sure you do the xcode first**
* Save dotfiles to $HOME

## Troubleshooting Tips
* If you run into file permission errors, give file execute permission `chmod 775 install.sh`
* If you have to add users to sudoers [follow these instructions](http://osxdaily.com/2014/02/06/add-user-sudoers-file-mac/)
* If you get a bunch of homebrew permission errors use this command `$ sudo chown -R $(whoami) $(brew --prefix)` (is the how todo it in High Sierra)
* You may need to install the latest vim using: `$ brew install vim --override-system-vi`

3. Run the install file
* `$ ./install.sh` (This will do a bulk of the work)
  * This will install homebrew and cask
  * This will install all your macos defaults
  * fix the iterm settings to have the correct path to plist file
  * install brew bundle and install your selected apps in Brew.sh (comment in or add new apps (comments in these files are `#`) or comment out apps you don't want)
  * This installs sublime with a `subl` command line shortcut
  * This installs the zsh shell and oh-my-zsh and the spaceship theme for this shell
  * All the aliases I like to use

4. Symlinks
*  `$ ./makesymlinks.sh` (inside `dotfiles`) installs all your symlinks
  -  You will see if you view in home directory `$ ls -la` and you'll see all the usual config dotfiles like `.vimrc` and `.zshrc` and now they have symlinks pointing to the dotfiles directory
  -  I organize it this way because it helps add config to github so adding this config to new machines takes minutes instead of hours
*  might have to manually install package control and restart sublime text

## Setup Iterm
* This will add my iterm2 preferences
* You first remove the existing iterm preferences with:
    - `$ rm ~/Library/Preferences/com.googlecode.iterm2.plist`
* Then you create a symlink to where the iterm2 preferences should be from the dotfiles iterm2 preferences (this will save you from having to make all the iterm2 config changes)
* The solarize light color scheme
* You can make changes to this plist file and just replace the existing plist file with the file your create to fit your custom needs
    - `$ ln -s ~/dotfiles/init/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist`
* The prompt I like to use for zsh

## Vim Stuff
* You first need to install Vundle (vim package manager) with:
    - `$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
* All the packages I like are added but need to be installed
    - To install them navigate to dotfiles
    - Open the vimrc file with `$ vim vimrc`
    - Install plugins with `:PluginInstall`
    - Close and reopen iTerm
  
## Run apps
* Alfred App (open using Spotlight with `cmd` + `spacebar`)
  - Open Preferences
    + Change hot key to `ctrl` + `spacebar`
    + Under features > Extras check Folders, Archives, Images, Text Files Documents
* Open Spectacle using Alfred and update keyboard shortcuts in preferences






