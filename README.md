# What is this?

There are a ton of dotfiles on the web and many of them are far more detailed then mine [View them all here](https://dotfiles.github.io/)

The point of dotfiles is if you get a new computer or move to a new computer you can get all the setting you like on that computer... and get them on that computer quickly. I got tired of spending 2 hours setting up a new computer. There has to be a better way and dotfiles are that better way

I teach at a school where the computers are wiped every night so it is essential I can get my students using the same setup

## Why this might be cool?

* I use this repo to add the exact setup I prefer to any Mac computer
  * This means I can have the exact same workflow and tools on any Mac computer I use, my laptop, work computer, a school computer
* To set this up manually would probably take me 2 hours
  * This dotfile helps me install all this stuff in under 15 minutes

## What gets installed by default?

* This will install homebrew, cask and bundle that make it possible to quickly install all this stuff
* This will install **node/npm**
* This will install git for version control
* This will install `hub`, `tree` and `trash`
  * **hub** is a great app to enable you to create github repos from the terminal
  * **tree** enables you to see a visual graph of the structure of files and folders
  * **trash** gives you the ability to send deleted items to the trash instead of deleting them permantly
* The `.macos` file is a bunch of mac settings I recommend setting up
* This installs the `spectacle` app which gives you great **window management**
* The `Brewfile` is a list of all the apps that I recommend installing
  * I commented out ones that I don't always use
  * But just removed the comment `#` if you want to install it
  * If you have an app already installed, this program will skip over it and not install it again so running `./install.sh` again won't cause a problem
* Globally via `npm` modules
  * **yarn**, **prettier**, **eslint**, **gulp**
* `Sublime Text`
  * This will set it up how I like to use it
  * With all the preferences, key bindings and packages
* `Vim`
  * This will set it up how I like to use it
  * It will install `Vundle`
    * The **vim package manager** I recommend
  * With all the packages and `.vimrc` settings
* This will install and make the `zsh` shell your default
* You will manually install `oh-my-zsh` (follow the instructions below)
  * This will install `zsh syntax highlighting`, `z.sh` and autocomplete which will make working in `iTerm2` that much better
* This will install `iTerm2`, it's settings, `cobalt2` theme and fonts I recommend

## Step-by-Step Instructions

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
  * Comment in or out apps (comments are `#`) that you want or don't want
* This installs Sublime Text
  * Once your aliases are set up you can open Sublime Text with `sop`
* This installs the zsh shell and makes it the default
* All the aliases I like to use are in the `aliases` file
  * Fork my repo and make the aliases fit your workflow
* I have a function tied to an alias to start a gulp boilerplate project

## Install oh-my-zsh

`$ cd` (go back to $HOME)
`$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

## Add Symlinks

* `$ cd dotfiles`
* `$ ./makesymlinks.sh` (make sure you are inside the `dotfiles` directory when you run this)

- You will see if you view $HOME with `$ ls -la` and you'll see all the usual config dotfiles like `.vimrc` and `.zshrc` and now they have symlinks pointing to the `dotfiles` directory

### Refresh the zshrc

* `$ source zshrc` (Make sure you are inside `dotfiles`)

#### Try out two of my aliases to see if it is working

* `$ desk` - Takes you to the `Desktop`
* `$ dotf` - Takes you to the `dotfiles` directory

## Setup Iterm

* This will add my iTerm2 Preferences

### Remove Existing iTerm2 settings

* You first remove the existing iterm preferences with:
  * `$ rm ~/Library/Preferences/com.googlecode.iterm2.plist`

### Create a symlink from dotfiles to the iTerm2 spot for iTerm2 preferences

* This will save you from having to make all the iterm2 config changes manually
* Here is the **symlink** that adds my suggested `iTerm2` preferences to your iTerm2
  * `$ ln -s ~/dotfiles/init/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist`
* **note** This install fira code font for Nerdtree and Vim by default but if this is not what you want you can override it in the text settings of the profile tab of iterm and choose what font and size you want for your text
  * I also show how to install Powerline font below as that is another font that many developers prefer

#### Web bos cobalt2

* This is the prompt I like to use for zsh
* Here is a [free set of videos](http://wesbos.com/command-line-video-tutorials/) from Wes Bos that are well worth your time and explain iTerm and the cobalt2 theme and how to install it

  * Move the **cobalt zsh theme** to the proper folder
    * `$ cp -R init/cobalt2.zsh-theme ~/.oh-my-zsh/themes`
  * Import the `cobalt2` color scheme into iTerm2 using:

  `Preferences > Profile > Colors`

  * And point to:

  `$HOME/dotfiles/init/cobalt2.itermcolors`

  * Refresh your shell to accept the changes with:

  `$ source ~/.zshrc`

## Add Cool fonts

* Right now if you look at your prompt you will see the cool cobalt2 colors but you will also see strange **question mark icons** and this is because our prompt is trying to render fonts that are not installed on your machine yet
* Let's add those fonts now

##### Install pip

* Pip is a python program that we need to install these special type of fonts

`$ sudo easy_install pip`

##### Install powerline fonts

* Grab the fonts
  * `$ cd ~/Desktop` then `$ git clone https://github.com/powerline/fonts`
  * `$ cd ~/Desktop/fonts`
* Install the fonts
  * `$ ./install.sh`
  * `$ rm -rf ~/Desktop/fonts` (clean up after yourself :) )
* Make the iTerm2 font settins look like this

![fonts settings iterm](https://i.imgur.com/8zLlEfZ.png)

* The important part is to make sure you go into iterm2 `Preferences > Profiles > Text tab` and change the font to **18pt Inconsolata for Powerline**

### [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) Syntax

* This lets you know if you are typing a valid command (green)
* Or an invalid command (red)

1. Clone this repository in oh-my-zsh's plugins directory:

       git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

2. Activate the plugin in `~/.zshrc`: (This step is already done)

       plugins=( [plugins...] zsh-syntax-highlighting)

3. Source `~/.zshrc` to take changes into account:

       source ~/.zshrc

* You will see an warning that your `.zshrc` can't find the `z.sh` file
* Let's fix that now

## Z and Frecent

* Frecent is not a word but it should be
* This is a great program that will help you quickly navigate files and folders on your machine
* Here is a [Wes Bos video](https://www.youtube.com/watch?v=qbNn5zJLZU0) showing you how production z can make you
* Move the `z.sh` file from `dotfiles` to your $HOME
  * `$ dotf` (alias takes you to ~/dotfiles)
  * `$ mv z.sh ~/` (Moves `z.sh` to $HOME)
  * `$ zfrash` (Using another alias to refresh your .zshrc shell config file)

## Sublime Text

* We already installed Sublime Text and even added some config preferences but let's now add all the packages and themes I recommend as well as the key bindings
* `$ dotf` (alias moves you to `$ cd ~/dotfiles`)
* `$ cd user-settings`
* `$ cp -R Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/`
  * That moves a file that contains all the packages I recommend you install for use with Sublime Text
  * To make this work you need to shut Sublime Text down and reopen it
    * When you do wait a minute and you should see a bunch of packages get installed
    * You way seem some error alert windows but you can just close them
* `$ cp -R Default\ \(OSX\).sublime-keymap ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/`
  * This adds the keybindings which is essentially `j` + `k` keyboard shortcut that quickly switches you into **Vintage Mode**
    * This converts Sublime Text to vim (kind of) and helps you start using Vim so that you can one day jump to Vim, the greatest text editor on the planet (imho)
* `$ cp -R Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/`
  * This spruces up our Sublime Text settings and makes you feel like you coding on a spaceship (thanks to Seti_UI)

## Vim Stuff

* Vim is a super awesome text editor that has a huge learning curve but well worth the time to learn it
* I have set it up with all the packages I like and feel free to dig in but I also have config setup for Sublime Text which might be a better choice for newbies
* You first need to install **Vundle** (vim package manager) with:
  * `$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
* All the packages I like are added but need to be installed
  * To install them navigate to dotfiles
  * Open the vimrc file with `$ vim vimrc`
  * Install plugins with `:PluginInstall`
  * Close and reopen iTerm
* Youcompleteme
  * We just installed `cmake` using brew
  * Compiling YCM with semantic support and JavaScript

```
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --javascript
```

## Run apps

* I like using Spectacle and Alfred all the time
* Alfred App (open using Spotlight with `cmd` + `spacebar`)
  * Open Preferences
    * Change hot key to `ctrl` + `spacebar`
    * Under features > Extras check Folders, Archives, Images, Text Files Documents
* Open Spectacle using Alfred and update keyboard shortcuts in preferences
  * I like using `ctrl` + `alt` + `cmd` as my 3 trigger keys
    * Then the 4 hours to move the window top, right, bottom left
    * The 3 triggers and spacebar for full screen
    * I use `[` and `]` and 3 trigger keys for **top left** and **top right**
    * I use `;` and `'` and 3 trigger keys for **bottom left** and **bottom right**
    * There is a way to automatically push the spectacle config to macos but just haven't figured it out yet (Stay tuned! or Pull Request the solution)

## Troubleshooting Tips

* If you run into file permission errors, give file execute permission `chmod 775 install.sh`
* If you have to add users to sudoers [follow these instructions](http://osxdaily.com/2014/02/06/add-user-sudoers-file-mac/)
  * If you are setting up a new user on your mac, you will need to do this
* If you get a bunch of homebrew permission errors use this command `$ sudo chown -R $(whoami) $(brew --prefix)` (is the how todo it in High Sierra)
* You may need to install the **latest vim** using: `$ brew install vim --override-system-vi`

## Install Macvim for for a faster terminal

```
brew reinstall vim --HEAD --with-cscope --with-lua --override-system-vim
brew reinstall macvim --HEAD --with-cscope --with-lua --override-system-vim
```

**note** the above 2nd command for macvim is currently broken in macvim8

## Feedback

* If you think I could do something better or I'm missing something please feel free to fork this repo and submit a pull request
* Happy Coding
