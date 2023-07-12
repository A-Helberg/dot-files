# Default git push to current branch
function gpoc
  echo "Pushing" (current_branch)
  git push origin (current_branch)
end
