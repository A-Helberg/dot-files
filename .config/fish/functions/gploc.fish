# Default git pull from current branch
function gploc
  echo "Pulling" (current_branch)
  git pull origin (current_branch)
end

