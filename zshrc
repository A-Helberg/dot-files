#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

. $HOME/.asdf/asdf.sh
. ~/.asdf/plugins/java/set-java-home.zsh

# Customize to your needs...
#
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# GO ----------------------------
# export PATH="$PATH:/usr/local/go/bin"
# export GOHOME="$HOME/go"

alias k='kubectl'

# Haskell Stack
export PATH="$PATH:/Users/andre/.local/bin"


# GIT ----------------------------
alias gst='git status'
alias ggp='git push origin HEAD:refs/for/master'
alias gm='git commit -m '
alias gca='git commit --amend'
alias gco='git checkout'
alias gbl='git branch --sort=-committerdate'

# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

# Default git push to current branch
function gpoc {
  echo Pushing $(current_branch)
  git push origin $(current_branch)
}

# Default git pull from current branch
function gploc {
  echo Pulling $(current_branch)
  git pull origin $(current_branch)
}

alias gbsm='git branch --merged | egrep -v "(^\*|master|dev)"'
alias gbdm='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

[[ -s "/Users/andre/.gvm/scripts/gvm" ]] && source "/Users/andre/.gvm/scripts/gvm"


export PATH="/usr/local/opt/libpcap/bin:$PATH"
alias dc=docker-compose

unalias rm

