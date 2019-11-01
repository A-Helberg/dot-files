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

# RBENV ----------------------------
#export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias gst='git status'
alias ggp='git push origin HEAD:refs/for/master'
alias k='kubectl'
alias gm='git commit -m '
alias gca='git commit --amend'

