# ---------------------------------------------
# PATH
# ---------------------------------------------

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Virtualenv should not prepend the virtualenv, since we are displaying it in the right prompt in the custom theme below
export VIRTUAL_ENV_DISABLE_PROMPT='1'

# RBENV ----------------------------
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# REACT-NATIVE
REACT_EDITOR=emacs
export PATH="/Users/andre/Library/Android/sdk/platform-tools:$PATH"

# NVM ------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ---------------------------------
# JAVA
# ---------------------------------
j7() {
  export JAVA_HOME=$(/usr/libexec/java_home -v 1.7);
  java -version
}

j8() {
  export JAVA_HOME=$(/usr/libexec/java_home -v 1.8);
  java -version
}

j9() {
  export JAVA_HOME=$(/usr/libexec/java_home -v 9);
  java -version
}


# ---------------------------------
# GO
# ---------------------------------

 export GOPATH=$HOME/GOPATH
 # default GO Path props ~/go
 export PATH="$PATH:$GOPATH/bin"



# ---------------------------------
# POSTGRES
# ---------------------------------
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

# Shortcut to run Postgress
pgserver() {
    /usr/local/Cellar/postgresql@9.6/9.6.8/bin/postgres -D /usr/local/var/postgres
}

# ---------------------------------
# MOBILE
# ---------------------------------
export ANDROID_HOME="/usr/local/Caskroom/android-sdk"

# ---------------------------------
# PYTHON
# ---------------------------------
# export PATH="/usr/local/sbin:/usr/local/lib/python2.7/site-packages:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$PATH"
# export PIP_REQUIRE_VIRTUALENV="" pip "$@"


# ---------------------------------
# ZSH CONFIG
# ---------------------------------
ZSH_THEME="agnostercustom"
COMPLETION_WAITING_DOTS="true"
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# ---------------------------------
# TMUX Integration
# ---------------------------------
# Always work in a tmux session if tmux is installed
#if which tmux 2>&1 >/dev/null; then
#  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
#      tmux attach -t hack || tmux new -s hack -c ~/Projects; exit
#  fi
# fi

schedprompt() {
  emulate -L zsh
  zmodload -i zsh/sched
  integer i=${"${(@)zsh_scheduled_events#*:*:}"[(I)schedprompt]}
  (( i )) && sched -$i
  zle && zle reset-prompt
  sched +5 schedprompt
}
 
# Uncomment this line to refresh prompt periodically
# schedprompt

# ---------------------------------
# Git Shortcuts
# ---------------------------------

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

function gpr {
  echo Opening pull request for $(current_branch)
  repo=`git remote -v | ag "origin.+push" | sed "s/git@github.com://" | sed "s,https://github.com/,," | cut -c8-999 | sed "s/\.git .*//"`
  branch=""
  if [ $1 ]; then
    branch="$1...$(current_branch)"
  else
    branch=$(current_branch)
  fi

  open "https://github.com/$repo/compare/$branch?expand=1"
}

alias gdm='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

# search git commit messages
gitgrep() {
  git log --all --grep=$1
}

gitclean() {
  git branch --merged $1 | grep -v '\* $1' | xargs -n 1 git branch -d
}

alias gti='git'
alias gm='git commit -m '

# ---------------------------------
# Misc. Shortcuts
# ---------------------------------
 
# Shortcut to run MySQL
mysqlserver() {
  mysql.server start
}

alias em='/usr/local/bin/emacs'
alias be='bundle exec'
alias bubble='bundle exec bundle install'
alias fuck_all_this_whitespace='find . -not \( -name .svn -prune -o -name .git -prune \) -type f -print0 | xargs -0 sed -i '' -E "s/[[:space:]]*$//"'
alias raisl=rails
alias k=kubectl

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/andre/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/andre/Downloads/google-cloud-sdk/path.zsh.inc'; fi
 
# The next line enables shell command completion for gcloud.
if [ -f '/Users/andre/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/andre/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

