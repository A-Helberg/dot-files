function gfpoc
  echo "FORCE Pushing" (current_branch)
  git push -f --set-upstream origin (current_branch)
end
