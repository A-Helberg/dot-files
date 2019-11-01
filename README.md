# dot-files

## Setup
Check ./bin/setup for an overview of how to install some of the files.
I use iTerm2 you'll find the color profile and the Monaco for Powerline font in the relavent directories and they should be enabled installed manually.

## Vim
Vim uses pathogen, after installing pathogen, you should run this to get all the plugins
`git submodule update`

You will also need to compile YouCompleteMe see their github page for details

## Tmux

To enable better scrolling on OSX and Iterm2

Enable the option under Preferences -> Profiles -> Terminal called:

`Save lines to scrollback when an app status bar is present`

## ZSH

`git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions`
