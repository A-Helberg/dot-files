# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Virtualenv should not prepend the virtualenv, since we are displaying it in the right prompt in the custom theme below
export VIRTUAL_ENV_DISABLE_PROMPT='1'

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
export GOPATH=~/GOPATH
export PATH="$GOPATH/bin:$PATH"


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="sun-and-moon"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/lib/python2.7/site-packages:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# # Always work in a tmux session if tmux is installed
if which tmux 2>&1 >/dev/null; then
  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
      tmux attach -t hack || tmux new -s hack; exit
  fi
fi

export PIP_REQUIRE_VIRTUALENV="" pip "$@"

# Setup rbenv shell integration
eval "$(rbenv init -)"

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

# Shortcut to run Postgress
pgserver() {
    postgres -D /usr/local/var/postgres
}

# Shortcut to run MySQL
mysqlserver() {
  mysql.server start
}

# Shortcut to open sublime
subl() {
    command subl .
}

# search git commit messages
gitgrep() {
  git log --all --grep=$1
}

gitclean() {
  git remote prune origin
}

alias em='/usr/local/bin/emacs'
alias gti='git'
alias be='bundle exec'
alias bubble='bundle'
alias gm='git commit -m '


nvm use 5
