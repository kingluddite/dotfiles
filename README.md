# Instructions
## Clone the repo to $HOME
* It is **important** you install the dotfiles in your $HOME directory
* `$ git clone https://github.com/kingluddite/dotfiles.git`
* `$ cd dotfiles`

## Intall xcode tools
* Just to be safe
* If you didn't install xcode you'll have to do this all over again
* Most likely this will already be installed but it doesn't hurt
* `$ xcode-select --install`

## Run the install file
* `$ ./install.sh`
* This will install homebrew and cask
* This will install all your Mac OS defaults (.macos)
* This will install brew bundle
* This will install your selected apps in Brew.sh
    - Comment in or out apps (comments are `#`) that you want or don't want
* This installs Sublime Text
    - Once your aliases are set up you can open Sublime Text with `sop`
* This installs the zsh shell and makes it the default
* All the aliases I like to use are in the `aliases` file
    - Fork my repo and make the aliases fit your workflow
* I have a function tied to an alias to start a gulp boilerplate project

## Install oh-my-zsh
`$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

## Add Symlinks
*  `$ ./makesymlinks.sh` (make sure you are inside the `dotfiles` directory when you run this)
  -  You will see if you view $HOME with `$ ls -la` and you'll see all the usual config dotfiles like `.vimrc` and `.zshrc` and now they have symlinks pointing to the `dotfiles` directory

### Refresh the zshrc
* `$ source zshrc` (Make sure you are inside `dotfiles`)

#### Try out two of my aliases to see if it is working
* `$ desk` - Takes you to the `Desktop`
* `$ dotf` - Takes you to the `dotfiles` directory

## Setup Iterm
* This will add my iTerm2 Preferences

### Remove Existing iTerm2 settings
* You first remove the existing iterm preferences with:
    - `$ rm ~/Library/Preferences/com.googlecode.iterm2.plist`

### Create a symlink from dotfiles to the iTerm2 spot for iTerm2 preferences 
* This will save you from having to make all the iterm2 config changes)
* Change to the `solarize light` color scheme (if you are on a projector) otherwise `solarize dark` is chosen by default
* Here is the symlink that adds my iTerm2 preferences to your iTerm2
    - `$ ln -s ~/dotfiles/init/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist`

### The prompt I like to use for zsh (web bos cobalt2)
  - Follow these instructions:
    + Move the **cobalt zsh theme** to the proper folder
      * `$ cp -R init/cobalt2.zsh-theme ~/.oh-my-zsh/themes/cobalt2.zsh-theme`
    + Import the cobalt2 color scheme into iTerm2 using Preferences > Profile > Colors and point to `$HOME/dotfiles/init/cobalt2.itermcolors`
    + `$ source ~/.zshrc`

#### The following are for the special font installations
##### Install pip
* `$ sudo easy_install pip`

##### Install powerline fonts
* `$ cd ~/Desktop` then `$ git clone https://github.com/powerline/fonts`
* `$ cd ~/Desktop/fonts`
* `$ ./install.sh`
* `$ rm -rf ~/Desktop/fonts` (clean up after yourself :) )
* Make the iTerm2 font settins look like this

![fonts settings iterm](https://i.imgur.com/8zLlEfZ.png)


### [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) Syntax
* This lets you know if you are typing a valid command (green)
* Or an invalid command (red)

1. Clone this repository in oh-my-zsh's plugins directory:

        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

2. Activate the plugin in `~/.zshrc`: (This step is already done)

        plugins=( [plugins...] zsh-syntax-highlighting)

3. Source `~/.zshrc`  to take changes into account:

        source ~/.zshrc

## Vim Stuff
* You first need to install Vundle (vim package manager) with:
    - `$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
* All the packages I like are added but need to be installed
    - To install them navigate to dotfiles
    - Open the vimrc file with `$ vim vimrc`
    - Install plugins with `:PluginInstall`
    - Close and reopen iTerm
  
## Run apps
* I like using Spectacle and Alfred all the time
* Alfred App (open using Spotlight with `cmd` + `spacebar`)
  - Open Preferences
    + Change hot key to `ctrl` + `spacebar`
    + Under features > Extras check Folders, Archives, Images, Text Files Documents
* Open Spectacle using Alfred and update keyboard shortcuts in preferences
  - I like using `ctrl` + `alt` + `cmd` as my 3 trigger keys
    + Then the 4 hours to move the window top, right, bottom left
    + The 3 triggers and spacebar for full screen
    + I use `[` and `]` and 3 trigger keys for **top left** and **top right**
    + I use `;` and `'` and 3 trigger keys for **bottom left** and **bottom right**
    + There is a way to automatically push the spectacle config to macos but just haven't figured it out yet (Stay tuned! or Pull Request the solution)

## Troubleshooting Tips
* If you run into file permission errors, give file execute permission `chmod 775 install.sh`
* If you have to add users to sudoers [follow these instructions](http://osxdaily.com/2014/02/06/add-user-sudoers-file-mac/)
  - If you are setting up a new user on your mac, you will need to do this
* If you get a bunch of homebrew permission errors use this command `$ sudo chown -R $(whoami) $(brew --prefix)` (is the how todo it in High Sierra)
* You may need to install the **latest vim** using: `$ brew install vim --override-system-vi`






