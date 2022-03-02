# Configuration files
These are my minimal configuration files the linux system I use.
I use it on my on my Thinkpad (X240), so it has working function keys and lights, and also settings for the touchpad and the trackpoint. It includes:

* Suckless software: dwm, dwmblocks and st;
* Neovim configuration, written in lua;
* The zsh shell with aliases and custom settings;
* The lf file manager;
* Zathura as a pdf reader;
* sxiv as a image viewer;
* Custom scripts and other useful stuff.

## Usage
I followed [Luke Smith](https://github.com/LukeSmithxyz/voidrice)'s structure for linux configuration:
* Configuration for everything is in the `.config` folder;
* Scripts in the `.local/bin` folder;
* Suckless software in the `.local/src` folder;
* `.xprofile` as a link to `.config/x11/xprofile` - the scripts inside this file run when X starts;
* `.zprofile` as a link to `.config/zsh/zprofile` - for enviromental variables, and running the dwm; this also runs at runtime;
* Configuration for other apps:
  * [dwm](./.local/src/dwm) (the windows manager)
  * [dwmblocks](./.local/src/dwm/) (statusbar)
  * [st](./.local/src/dwmblocks/) (terminal)
  * [neovim](./.config/nvim/) (editor)
  * [zsh](./.config/zsh/) (shell)
* [ThinkPad-specific configuration](thinkpad-specific.md)

## Installation
Before installing, make sure your configs have been backed up. `install.sh` has some backup protection, but it is no way guaranteeing that it won't mess up your configurations. Use at your own risk.

`curl -Lks http://bit.do/install-dots | /bin/bash`

## Special Thanks to
* [Luke Smith](https://lukesmith.xyz/). I learned a lot from him, and also stole a lot of stuff from his dotfiles. My dotfiles are largely based on his, so be sure to check him out too
* [Atlassian](https://www.atlassian.com/git/tutorials/dotfiles) for teaching me how to sync my dotfiles to git, and the script
* [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
* [the Suckless team](https://suckless.org/) for its awesome software
* [neovim-lua-config](https://github.com/miltonllera/neovim-lua-config), as my neovim config is basically the same as this
