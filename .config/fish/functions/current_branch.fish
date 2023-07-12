# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function current_branch
  set ref (command git symbolic-ref --quiet HEAD 2>/dev/null)
  set ret $status
  if test $ret != 0
    if test $ret = 128
      return  # no git repo.
    end
    set ref (command git rev-parse --short HEAD 2>/dev/null)
    test $status != 0; and return
  end
  echo (string replace -r '^refs/heads/' '' $ref)
end

