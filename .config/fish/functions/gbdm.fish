# git branch delete merged
alias gbdm='git branch --merged | egrep -v "(^\*|master|dev|main)" | xargs git branch -d'
