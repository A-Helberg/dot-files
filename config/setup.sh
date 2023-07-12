#!/bin/bash

#open --wait-apps /System/Applications/System\ Settings.app/Contents/MacOS/System\ Settings

if ! plutil -lint /Library/Preferences/com.apple.TimeMachine.plist >/dev/null ; then
  echo "This script requires your terminal app to have Full Disk Access."
  echo "Add this terminal to the Full Disk Access list in System Preferences > Security & Privacy, quit the app, and re-run this script."
  echo "Changing the setting will require the terminal to restart."
  echo "Run this script again."
  open "x-apple.systempreferences:com.apple.preference.security?PrivacyFileAccess"
  exit 1
fi

echo "Enabling ssh"
sudo systemsetup -setremotelogin on

# Make sure the .ssh directory is set up correctly
ssh -oStrictHostKeyChecking=no -oPasswordAuthentication=no -oBatchMode=yes localhost ls > /dev/null 2>&1 

if [ ! -f "$HOME/.ssh/id_rsa" ]; then
  if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
    echo "You do not have your SSH key pair installed"
    echo "Add your keys (ssh should be enabled) and run the script again"
    exit 1
  fi
fi


echo "Installing xcode-stuff"
xcode-select --install

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  export NONINTERACTIVE=1
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

brew install asdf
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
source ${ZDOTDIR:-~}/.zshrc
asdf plugin-add python
asdf install python 2.7.18
asdf global python 2.7.18


echo "Installing Git..."
brew install git

echo "Git config"

git config --global user.name "Andre Helberg"
git config --global user.email helberg.andre@gmail.com

echo "Cleaning up brew"
brew cleanup

echo "Installing homebrew cask"
brew install caskroom/cask/brew-cask

echo "Making Projects directory""
mkdir ~/Projects 2>/dev/null

echo "Copying dotfiles from Github"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
git clone --bare git@github.com:A-Helberg/dot-files $HOME/.cfg
config checkout

# Apps
apps=(
  bettertouchtool
  firefox
  google-chrome
  vagrant
  iterm2
  virtualbox
  vlc
  slack
  spectacle
  the-unarchiver
  1password
  little-snitch
  amorphousdiskmark
  docker
  karabiner-elements
)

echo "installing apps with Cask..."
brew install --cask ${apps[@]}

apps=(
  dockutil
  neovim
  fish
  rg
  gitui
  tmux
  vagrant
  packer
  vault
  nomad
  starship
)

brew install ${apps[@]}

dockutil --remove "Launchpad"
dockutil --remove "Messages"
dockutil --remove "Mail"
dockutil --remove "Maps"
dockutil --remove "Photos"
dockutil --remove "FaceTime"
dockutil --remove "Calendar"
dockutil --remove "Contacts"
dockutil --remove "Reminders"
dockutil --remove "Notes"
dockutil --remove "Freeform"
dockutil --remove "TV"
dockutil --remove "Music"
dockutil --remove "App Store"

brew cleanup

defaults write com.apple.dock static-only -bool TRUE
defaults write com.apple.dock mineffect suck
defaults write com.apple.dock largesize -int 512

# set key repeat to quick
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1

killall Dock
 
