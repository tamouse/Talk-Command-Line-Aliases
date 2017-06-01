# Starter pack of aliases
#
# Edit your `$HOME/.bash_profile` file, and add
# these at the end.

# Show a full directory listing, marking files
# as their type
alias ll='ls -alF'

# Save time typing out `git status`
alias gs='git status'

# Shorten the git dance to `gacp 'Commit Message'`
gacp() {
  git add --all -v
  git commit -m "$1"
  git push -u origin HEAD
}


# If you are in git-bash, you might want this one:
alias more=less
