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

# Customize to your needs...
#
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# RBENV ----------------------------
#export PATH="$HOME/.rbenv/bin:$PATH"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"

eval "$(rbenv init -)"

# NVM ----------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# GO ----------------------------
export PATH="$PATH:/usr/local/go/bin"
export GOHOME="$HOME/go"

alias k='kubectl'

# Haskell Stack
export PATH="$PATH:/Users/andre/.local/bin"


# GIT ----------------------------
alias gst='git status'
alias ggp='git push origin HEAD:refs/for/master'
alias gm='git commit -m '
alias gca='git commit --amend'

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

export DOCKER_HOST_IP=$(ip route | grep docker0 | awk '{print $9}')
