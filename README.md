# Welcome to my dotfiles

- There are a ton of dotfiles on the web, and many of them are far more detailed than mine [View them all here](https://dotfiles.github.io/)
- The point of dotfiles is if you get a new computer or move to a new computer you can get all the settings you like on that computer... and get them on that computer quickly.
- I got tired of spending 2 hours setting up a new computer. There has to be a better way, and dotfiles are a better way

## Which OS?

- This is for only Mac users

## Why might this be cool?

- I use this repo to add the exact setup I prefer to any Mac computer
  - This means I can have the same workflow and tools on any Mac computer I use, my laptop, work computer, a school computer
- To set this up manually would probably take me 2 hours, and dotfile helps me install all this stuff in under 15 minutes

## Make sure you install your XCode tools first

`$ xcode-select --install`

- If you don't, you'll get an error similar to this

```
xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools),
missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun
```

## Mac M1 ARM chip

- I tried to use my old dotfiles with a new Mac computer with the M1 chip, and it made me have to update these dotfiles

## Homebrew and M1 don't play nice natively yet

- To get them to play nice, you need to:
  - [resource](https://www.macrumors.com/2020/11/18/apple-m1-mac-tidbits/)

```
Running x86 Apps Homebrew Apps
The developers behind the Notion app for Macs shared a blog post on getting homebrew or other terminal apps that don't have Arm support to run on an ‌Apple Silicon‌ Mac. The steps are as follows:

1. Create a duplicate of the Terminal app in the Utilities folder
2. Right-click on the app and choose Get Info
3. Rename the other version of the app into something recognizable (like "Rosetta Terminal")
4. Check off the "Open using Rosetta" option

That's all there is to it.

Once Open using Rosetta is selected, homebrew apps can be run in the Terminal on ‌Apple Silicon‌ Macs.
```

## What gets installed by default?

- `homebrew,` `cask` and `bundle` that make it possible to install all this stuff quickly
- `node` (and that comes with `npm` baked in)
  - I gave up on `yarn` :(
- `git` for version control
- `hub` and `gh` enables you to create Github repos directly from the terminal
  - Now, with The Github CLI, we may soon be able to put `hub` out to pasture, but as it stands right now, I use them both
- `tree` shows you your file/folder structure
  - And I have a nice function that works well with this to ignore `node_modules` and other stuff you don't want to see when you're searching through folder structures
- `trash` a better way to delete files than `$ rm -rf` because if you delete with `$ rm -rf`, stuff is gone forever
- `rectangle` app which gives you great **window management**
  - [Rectangle docs](https://github.com/rxhanson/Rectangle)
  - Here is a screenshot of my Rectangle settings to give you an idea of how I use the keyboard to control my windows (Rectangle makes migrating from Spectacle super simple)
- `firefox` and `chrome` browsers
- `alacritty` and `iTerm` terminals (Both are way better than the default Terminal that ships with mac, and Alacritty is my current terminal - using this with Tmux is very powerful)
- `tmux` - terminal multiplexer (If you never heard of this, dig in and check it out - very cool)
- `vscodium` a duplicate of Visual Studio Code but works well with neovim
- `Slack`
- `mac2imgur` - I use this for saving screenshots as a URL to add to my markdown notes easily
- `caffeine` - keeps my computer from going to sleep
- `zsh` is my preferred shell
- `karabiner-elements`
  - This is a great add on to get control of your keys and key mapping
  - [docs](https://karabiner-elements.pqrs.org/)
- `docker`
- `insomnia` and `postman` for RESTful API help
- `mysqlworkbench` for MySQL stuff
- `grammarly` - makes your writing so much more professional looking
  - [The app and the chrome extension](https://app.grammarly.com/)
- `dropbox`
  - I used dropbox to sync my Alfred settings from the old computer to the new computer

### Brewfile

- `Brewfile` is a list of all the apps that I recommend installing
- I commented out ones that I don't always use but just removed the comment `#` if you want to install
- Review the Brewfile and adjust it as you need it (before running the install)

### .macos

- There is a ton of Mac-specific stuff in this file
  - I recommend going through this with a fine-tooth come to make sure you know what the changes are and you are cool with those changes
  - This file has settings
- `.macos` file is a bunch of mac settings I recommend setting up
- Show hidden files
  - If you want to show hidden files (by default they are the hidden files are hidden :) )
  - If I want to download NerdFonts I need to see a hidden file `~/.local/share/fonts`

`$ defaults write com.apple.Finder AppleShowAllFiles true`

`$ killall Finder`

- Do the same two lines but set `true` to `false` to hide hidden files again

### Globally via `npm` modules, we will install

- `prettier` (formats your code nicely)
- `Sublime Text`
  - This will set it up how I like to use it with all the `preferences,` `key bindings` and `packages`
- `VS Code`

### Neovim

- I switched from Vim to Neovim
- If you'd like to use Neovim, I highly recommend [watching all of these videos](https://www.youtube.com/watch?v=65Wq4fjREUU&list=PLhoH5vyxr6QqPtKMp03pcJd_Vg8FZ0rtg), so you understand the setup and the plugins (big props to ChrisAtMachine!)

#### Install my Neovim settings

- Create `/.config` and clone my [Neovim repo](https://github.com/kingluddite/nvim) into it

#### Trying to upgrade to Neovim 0.5.0 Nightly build

- **ignore this if you don't want to use neovim with VS Codium**
- Neovim nightly 0.5.0 - I want to use the neovim plugin for VS Codium because [it is a requirement for neovim to work in VS Codium](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim)

##### How to install the latest Neovim:

`$ brew install --HEAD neovim`

- **caution** This may lead to some issues upgrading to the latest version of neovim
- I received an error, and this [neovim issue helped](https://github.com/neovim/neovim/issues/8809)

#### Install all the plugins for Neovim

- Once you clone nvim, you need to install all the plugins
- You may need to install python 3 [need to add python3](https://i.imgur.com/jkP3hMH.png) via Homebrew
  - Remember all Homebrew installs must be done through the Rosetta terminal

### Tmux

- [My Tmux Repo](https://github.com/kingluddite/dot-tmux)

#### Install tmux config

```
$ git clone git@github.com:kingluddite/dot-tmux.git ~/.tmux`
$ ln -s ~/.tmux/tmux.conf ~/.tmux.conf
```

## Here are Step-by-Step Install Instructions

- Now the moment you've all been waiting for...

#### Clone the repo to $HOME

- It is **important** you install the `dotfiles` in your `$HOME` directory
- This means you open your terminal and type `$ cd` and it will automatically take you to your `$HOME`
  - FYI `$HOME` and `~` both signify the "home" directory

1. Change to your home directory

`$ cd`

2. Clone my dotfiles to your $HOME

`$ git clone https://github.com/kingluddite/dotfiles.git`

3. Change into the cloned `dotfiles` directory now in your $HOME directory

`$ cd dotfiles`

#### Install XCode tools

- This is an important step
  - **IMPORTANT** You need to do this because if you don't and you recently updated your OS, you will have to do these instructions all over again
- **note** Most likely, this will already be installed, but it doesn't hurt to try it

`$ xcode-select --install`

- Yes, I told you before to install them but it can't hurt to remind you :)

#### Run the install file

`$ ./install.sh`

##### What if I want to rerun the install?

- If you have an app already installed, this program will skip over it and not install it again, so running `./install.sh` again won't cause a problem

### Install my neovim dotfiles

- The default install for neovim is `~/.config`
- Create that directory and change into it:

`$ cd && mkdir .config && cd .config`

- Clone my repo inside `.config`

`$ git clone https://github.com/neovim/homebrew-neovim`

## oh-my-zsh

- What is [oh my zsh](https://ohmyz.sh/)?
  - "Oh My Zsh is a delightful, open-source, community-driven framework for managing your Zsh configuration. It comes bundled with thousands of helpful functions, helpers, plugins, themes, and a few things that make you shout... "Oh My ZSH!"
- [oh-my-zsh docs](https://github.com/robbyrussell/oh-my-zsh)

### Install oh-my-zsh

- `$ cd` (go back to $HOME)
- `$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

#### Add cool highlighting

- This lets you know if you are typing a:
  - A valid command (green)
  - Or an invalid command (red)
- Clone this repository in oh-my-zsh's plugins directory (on your local machine):

```
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

- Refresh with `$ zfrash` (my alias)

#### Z and Frecent

- "Frecent" (_Fun made-up word that combines `frequently` and `recently` - and this is a way to see what files you were recently using_)
- This is a great program that will help you quickly navigate files and folders on your machine
- Here is a [Wes Bos video](https://www.youtube.com/watch?v=qbNn5zJLZU0) showing you how production `z` can make you

## Troubleshooting oh-my-zsh

### Solution to the following error:

- You will see a warning that your `.zshrc` can't find the `z.sh` file

![warning can't see z.sh](https://i.imgur.com/5bChcCw.png)

- Move the `z.sh` file from `dotfiles` to your `$HOME` directory

`$ dotf` (alias takes you to ~/dotfiles)

`$ mv z.sh ~/` (Moves `z.sh` to $HOME)

`$ zfrash` (Using another `alias` to refresh your `.zshrc` shell config file)

### Fix a oh-my-zsh permissions error

- You may get an error similar to:

```
[oh-my-zsh] Insecure completion-dependent directories detected:
drwxrwxr-x  7 USERNAMEHERE  admin  224 Nov 20 20:29 /usr/local/share/zsh
drwxrwxr-x  7 USERNAMEHERE  admin  224 Nov 20 20:30 /usr/local/share/zsh/site-functions

[oh-my-zsh] For safety, we will not load completions from these directories until
[oh-my-zsh] you fix their permissions and ownership and restart zsh.
[oh-my-zsh] See the above list for directories with group or other writability.

[oh-my-zsh] To fix your permissions, you can do so by disabling
[oh-my-zsh] the write permission of "group" and "others" and making sure that the
[oh-my-zsh] owner of these directories is either root or your current user.
[oh-my-zsh] The following command may help:
[oh-my-zsh]     compaudit | xargs chmod g-w,o-w

[oh-my-zsh] If the above didn't help or you want to skip the verification of
[oh-my-zsh] insecure directories you can set the variable ZSH_DISABLE_COMPFIX to
[oh-my-zsh] "true" before oh-my-zsh is sourced in your zshrc file.
```

- [this GitHub issue for OMZ fixed it](https://github.com/ohmyzsh/ohmyzsh/issues/6835)
  - Just change permissions by typing this:

```
$ chmod 755 /usr/local/share/zsh
$ chmod 755 /usr/local/share/zsh/site-functions
```

## Add Symlinks

- [What are symlinks?](http://hints.macworld.com/article.php?story=2001110610290643)
- **note** Make sure you are inside the `dotfiles` directory when you run this
- You will see if you view `'$HOME` with `$ ls -la` and you'll see all the usual config dotfiles like `.vimrc` and `.zshrc` and now they have symlinks pointing to the `dotfiles` directory

`$ cd dotfiles`

`$ ./makesymlinks.sh`

### Refresh the zshrc

`$ source zshrc` (Make sure you are inside `dotfiles`)

- Or you could also use the `$ zfrash` alias

#### Installing autosuggest

`$ brew install zsh-autosuggestions` (this is in homebrew bundle and should be installed)

- But you also need to add it to your .zshrc by adding this line2⃣

`$ source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh`

- you may get this annoying error2⃣

```
zsh-syntax-highlighting: unhandled ZLE widget 'autosuggest-accept'
zsh-syntax-highlighting: (This is sometimes caused by doing `bindkey <keys> autosuggest-accept` without creating the 'autosuggest-accept' widget with `zle -N` or `zle -C`.)
```

```

* This fix is to make sure you have autosuggest in plugin like this2⃣


`.zshrc`

```

plugins=(vi-mode zsh-autosuggestions fzf)

```

#### Testing if aliases are working

- Try out two of my aliases to see if it is working

`$ desk` - Takes you to the `Desktop`

`$ dotf` - Takes you to the `dotfiles` directory

## Setup iTerm2

- This will add my iTerm2 Preferences

### Remove Existing iTerm2 settings

- You first remove the existing iterm preferences with:

`$ rm ~/Library/Preferences/com.googlecode.iterm2.plist`

### Create a symlink

- Create a symlink from dotfiles to the iTerm2 spot for iTerm2 preferences
- This will save you from having to make all the iterm2 config changes manually
- Here is the **symlink** that adds my suggested `iTerm2` preferences to your iTerm2
- **IMPORTANT** The following code you type in the terminal is all ONE LINE

`$ ln -s ~/dotfiles/init/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist`

- **note** This installs `fira code` font for Nerdtree and Vim by default, but if this is not what you want, you can override it in the text settings of the profile tab of iterm and choose what font and size you want for your text
  - I also show how to install Powerline font below as that is another font that many developers prefer

### Make your iTerm2 terminal look cool

- Web Bos `cobalt2` zsh theme
- If you want your terminal to look wicked cool, follow these steps
- This is the prompt theme I like to use for zsh
- Here is a [free set of videos](http://wesbos.com/command-line-video-tutorials/) from Wes Bos that are well worth your time and explain iTerm and the cobalt2 theme and how to install it

1. Move the **cobalt zsh theme** to the proper folder

`$ cp -R init/cobalt2.zsh-theme ~/.oh-my-zsh/themes`

2. Import the `cobalt2` color scheme into iTerm2 using:

`Preferences > Profile > Colors`

- And point to:

`$HOME/dotfiles/init/cobalt2.itermcolors`

- Refresh your shell to accept the changes with:

`$ source ~/.zshrc` (or use `$ zfrash` alias)

## Add Cool fonts

- Right now, if you look at your prompt, you will see the cool cobalt2 colors, but you will also see strange **question mark icons** and this is because our prompt is trying to render fonts that are not installed on your machine yet
- Let's add those fonts now

##### Install pip

- Pip is a python program that we need to install these special type of fonts

`$ sudo easy_install pip`

##### Install powerline fonts

1. Let's save these fonts temporarily to our Desktop

`$ cd ~/Desktop`

2. Grab the fonts from the Powerline Github repo and clone them to our Desktop

`$ git clone https://github.com/powerline/fonts`

3. Change into our new font folder

`$ cd ~/Desktop/fonts`

4. Install the fonts

`$ ./install.sh`

5. Remove the fonts (Awesome polite to clean up after ourselves :) )

`$ rm -rf ~/Desktop/fonts`

### Change iTerm2 settings

- Make the iTerm2 font settings look like this:

![fonts settings iterm](https://i.imgur.com/8zLlEfZ.png)

- The **important** part is to make sure you go into iterm2 `Preferences > Profiles > Text tab` and change the font to **18pt Inconsolata for Powerline**

### Troubleshoot iTerm2

- Problem with iTerm2 autosuggest - the color is hard to see
  for powerline in the text tab
  - `Solution`: Check the "use built-in Powerline glyphs" checkbox
- Problem with `autosuggest` color (hard to read) adjust selection text color and drag up the minimum contrast so you can see it better (_here are what my settings look like_)

![my iTerm2 color settings](https://i.imgur.com/wO8NZhR.png)

#### iTerm2 window restoration disabled warning

![iTerm2 window restoration disabled warning](https://i.imgur.com/r12EEfg.png (need to uncheck close windows when closing an app)

## Sublime Text (optional only if you want to use Sublime Text)

- This is a free editor; I bought a license a long time ago, and it still works like a charm
- This is a great, fast editor
- **note** If you don't pay for a license, it will remind you every so often that you don't have a license with an alert window
- Turn on Spell check
- **important** Make sure you Install package control
  - [Follow these steps](https://packagecontrol.io/installation)

`ctl + shift + p` and select "Install Package control"

- **note** You will get a ton of alert window errors of empty packages trying to install themselves; close those windows (there is probably a better way to solve this problem, but I'm too lazy - let me know if you have a better solution)
- **note** - We already installed Sublime Text with our installer file

#### Adding Sublime Text Packages

- And even added some config preferences but let's now add all the packages and themes I recommend as well as the key bindings

`$ dotf` (alias moves you to `$ cd ~/dotfiles`)

`$ cd user-settings`

`$ cp -R Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/`

- That moves a file that contains all the packages I recommend you install for use with Sublime Text
- To make this work, you need to shut Sublime Text down and reopen it
- When you do wait a minute, and you should see a bunch of packages gets installed
- You may see some error alert windows, but you can close them

#### Add Sublime Text key bindings

`$ cp -R Default\ \(OSX\).sublime-keymap ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/`

- This adds the keybindings, which is essentially `j` + `k` keyboard shortcut that quickly switches you into **Vintage Mode** (for Vim mode inside Sublime Text)
- This converts Sublime Text to Vim (kind of) and helps you start using Vim so that you can one day jump to Vim, the greatest text editor on the planet (IMHO)
  - And now Neovim is what I believe the greatest text editor on the planet :)

`$ cp -R Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/`

- This spruces up our Sublime Text settings and makes you feel like you coding on a spaceship (thanks to Seti_UI)

##### Troubleshooting Sublime Text Vintage mode

- There are other Vim setups for ST3 - I am happy with Vintage mode
- But sometimes it breaks and deleting in vim, got to the end of the line, takes forever. If this happens reset ST3
- When ST3 "breaks" (every now and then) it takes me a couple hours to fix it
  - The key bindings are messed up, I have to type `d` 3 times to delete a line, appending adds an `a` at the end, it just becomes a terrible user experience and you need a fresh install of ST3 to get it back to work properly
- Do this the next time this happens
- https://www.sublimetext.com/docs/3/revert.html

OS X: ~/Library/Application Support/Sublime Text 3

Grab everything and put in a backup folder on your desktop (just grab all the stuff in that folder and put it
somewhere safe in case you need it). We are just going to repopulate ST3 like we did before and vintage should
work as we expect (if all is good you can blow up your backup settings unless there was custom work you want to retain like packages and bindings)s
Go to [my dot files](https://github.com/kingluddite/dotfiles)

- Go into your dotfiles locally (like you did before) and and follow the three "cp -R instructions" above to get ST3 and vintange working well again

#### Sublime License
* Sublime is free but will remind you with popup often
* Buy a license and get rid of popup
* At times you'll need to reinstall Sublime Text and every time you'll need that License you recieved via email. You'll need to search for it and it's title is something like "Sublime Text License Key". Click Enter Registration inside Sublime and copy and paste that license.
## Vim Stuff

- Vim is a super awesome text editor that has a huge learning curve but well worth the time to learn it
- I have set it up with all the packages I like and feel free to dig in, but I also have a config setup for Sublime Text, which might be a better choice for newbies
- I am using Plug to install plugins (switched from Vundle)
- **note** I am no longer using Vim but now switched to Neovim - If you want to use Vim, you may want to check out MacVim

## Why don't I just use VS Code?

- I love Sublime Text for taking markdown notes. I've been doing it for years and love it's speed and I just am used to it
- I invested a lot of time learning Vim but saw the community kind of move towards Neovim and after watching the ChristAtMachine neovim youtube series, I jumped to Neovim
- I teach and need to use VS Code in the classroom. Why not make VS Code work like Neovim and that's what I'm trying to do (I also have Sublime Text using Vim like stuff and the goal is just to keep typing all my neovim keyboard shortcuts everywhere so I get better and faster)

## Databases

- When you run the databases decide if you want to run them as services (if you do, they will start automatically on a cold reboot)

### MongoDB

- If you get this error🔛

![mongo connection error](https://i.imgur.com/Mf7TIea.png)

- Just run `$ brew services start mongodb-community` to start mongodb as a service

### Postgres

### MySQL

- MySQL Workbench (IDE for working with MySQL)
- To avoid a pesky error "Can’t connect to local MySQL server through socket ‘/tmp/mysql.sock" start mysql as a server with `$ brew services start mysql` and just run `$ mysql -uroot` and you can run without a password. I find developing it is easier to just use no password, enter an empty string as a password for connecting to mysql

## Tools

### grep

- https://stackoverflow.com/questions/59232089/how-to-install-gnu-grep-on-mac-os
- [Why did we install grep with Homebrew?](https://news.ycombinator.com/item?id=19522456)

## Apps

### Rectangle (window management)

- I like using `Rectangle` for window management (_I used to use Spectacle, but it is no longer being maintained, and they recommended checking out Rectangle, and it works just as well as Spectacle with even more options - and it's free_)
- Uninstall Spectacle and use [Rectangle](https://github.com/rxhanson/Rectangle) as replacement
- Here are my [current Rectangle settings](https://i.imgur.com/oVFzZCW.png)

### mac2imgur

- Open the mac2imgur app and sign in (_ This app allows you to save screenshots on imgur_)

### Alfred App (open using Spotlight with `cmd` + `spacebar`)

- I love Alfred App
- I paid for the Powerpack and used Snippets for productivity (_I used to use TextExpander, but they kept charging me for upgrades, so I just stuck with Alfred App - there is a ton to this, so do your research on this - well worth the time invested_)
  - If you buy Powerpack (or bought it before), remember to add the Powerpack license to Alfred App
  - You should also check out Alfred app Workflows for productivity improvements
- Sync Alfred app with an old and new computer (If you want to migrate your Alfred configurations from one to computer to your new computer, [this will save you time](https://www.alfredapp.com/help/advanced/sync/)!)
- Also, don't forget this step
  - Alfred app `preferences` > `features` > `snippets` (_and check "Automatically expand snippets by keyword"_)

![screenshot of above instructions](https://i.imgur.com/80D1Heq.png)

### Alacritty

- [Good read on migrating from iterm to alacritty](https://medium.com/@pezcoder/how-i-migrated-from-iterm-to-alacritty-c50a04705f95)

### Chrome

- (or any browser) - I like to have the browser ask me where to save downloads instead of just putting it directly inside Downloads automatically
  - Each browser has it's own setting for this, this is how to do it inside Chrome
  - [source](https://osxdaily.com/2017/01/14/change-chrome-download-location/)

![how to tell Chrome you want to determine where files will be saved](https://i.imgur.com/80D1Heq.png)

### Git

- **Remember**
  - You will need to update your name and email in the git config file
  - Make sure to save these changes
  - You'll need to create a new SSH key and share it with GitHub
  - [Create new ssh key and add to github](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

### Slack

- Sign in with your email and get access to all Slack workspaces you need

### Neofetch

- [what is neofetch](https://github.com/dylanaraps/neofetch)

## General Troubleshooting Tips

- `zfrash` (that is my alias to refresh the `zshrc`)
- Open my aliases file to see all my aliases and customize them as you see fit
- There are some cool functions in the functions file (check it out to see if it gives you any ideas for productivity improvements)

### FZF error

- If you get this error

```

[oh-my-zsh] fzf plugin: Cannot find fzf installation directory.
Please add "export FZF_BASE=/path/to/fzf/install/dir" to your .zshrc

```

- Use your Rosetta terminal to install `fzf` with Homebrew

`$ brew install fzf`

### App won't open

- You may run into this on Mac, and you'll think you can't install the App
  - Don't panic; it is just Apple trying to protect you
  - I received this error when I tried to run Alacritty terminal
  - After you add it to permissions:

![add it to permissions](https://i.imgur.com/PF7PhNu.png)

- Then open it and then in `General` click `"open anyway"`

![open anyway](https://i.imgur.com/mSTCRHB.png)

- Here is a Mac warning I received for opening Slack - you will see this for all images you open to give mac permission to open it

![Slack permissions warning](https://i.imgur.com/i2u6qaD.png)

- give Slack permission to access files in your downloads folder

![giving Slack permission](https://i.imgur.com/LArXTR8.png)

## Feedback

- If you think I could do something better or I'm missing something, please feel free to fork this repo and submit a pull request (Sharing is Caring)
- Happy Coding

## NerdFonts

- [Add Fonts with Nerd Fonts to Alacritty](https://www.youtube.com/watch?v=fR4ThXzhQYI)

- [Walks throught the step-by-step of the config](https://www.youtube.com/watch?v=eXyrTFNsdHA)

### Special Instructions for installing NerdFonts on Mac

- Use [Homebrew](https://github.com/Homebrew/homebrew-cask-fonts)
- To install it's a two step process:

1. brew tap homebrew/cask-fonts # You only need to do this once!
2. brew cask install font-hack-nerd-font # Then just do this again for all other fonts you want to install

- All the other casks are inside the [Casks folder](https://github.com/Homebrew/homebrew-cask-fonts/tree/master/Casks)
- That's it. You will now see icons inside Alacritty
- **note** [Fira Code is a very cool concept](https://github.com/tonsky/FiraCode)

### Manual installs

- live-server
  - I use this a lot so install globally with `$ npm i live-server -g`
```
