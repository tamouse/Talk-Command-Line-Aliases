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

# If you are in git-bash on Windows, you might want this one:
alias more=less

## Some basic aliases:
# make standard file manipulation commands verbose
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias tac="tail -r "

# Capture the location of the ls command
export LSCMD=$(which ls)
# Depending on the system, set the colour options
if [ "$system_type" == "Darwin" ] ; then
  # "Darwin" is macOS
  export LS_OPTS="-G"
else
  export LS_OPTS="--color=auto"
fi

alias ls="$LSCMD -AFGh $LS_OPTS"
alias ll="$LSCMD -AFGlh $LS_OPTS"
alias l1="$LSCMD -1h $LS_OPTS"
alias lm="$LSCMD -mh $LS_OPTS"

alias now='date "+%T"'

# This one works on Linux
alias ports='netstat -tulanp'

# These work on macOS
alias openip='lsof -Pnl +M' # open IP connections (4 or 6)
alias openip4='lsof -Pnl +M -i4' # open IPv4 connections
alias openip6='lsof -Pnl +M -i6' # open IPv6 connections

alias cpan='echo use cpanm instead'

alias phplint='php -l'
alias phplintdir='for f in $(find . -name "*.php") ; do php -l "$f"; done'

alias ping1='ping -c 1'
alias timestamp='date "+%Y-%m-%d-%H-%M-%S"'

alias s3sync='s3cmd -r --rexclude-from=$HOME/.s3sync-excludes sync '

function tree () {
  /bin/ls -AR | grep ':$' | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
}

# replace spaces in file names with underscores
function unspace_filename () {
  echo "$1" | tr --squeeze-repeats " " "_"
}

# lowercase file names
function lc_filename () {
  echo "$1" | tr '[:upper:]' '[:lower:]'
}

# clean file name: lower case, no spaces, alphanumeric plus _-+. only
function clean_filename () {
  echo "$1" | perl -p -e 'chomp;s/\s+/_/g;s/[^[:alnum:]_+\.-]*//g;lc;'
}

# find diff between backup and current files in pwd after a filtering operation
function diffbak () {
  for f in *.bak ; do
	  diff "${f%%.bak}" "$f"
  done
}

# push back original files in pwd after filtering operation
function restore () {
  for f in *.bak ; do
	  mv -v "$f" "${f%%.bak}"
  done
}

# rename old files in pwd with new extension
function rename_all () {
  for f in *.$1 ; do
	  mv "$f" "${f%%.$1}.$2"
  done
}

function psgrep() {
  ps auxww | grep -v grep | grep --color=auto -E "(^USER|$*)"
}

alias clean_photos='for f in *; do chmod -x $f ; mv $f $(echo $f|tr "A-Z_" "a-z-"); done'

function dl() {
  echo $(date "+%FT%T") "$PWD" ':' "$@" >> $HOME/.dev.log
}

## Interesting bash function for setting up a new front-end project
# Usage: new_project DIRNAME DESCRIPTION
function new_project() {
  git init "$1" && \
	  pushd "$1" && \
	  echo "$2" > README.txt && \
	  echo "$2" > .git/description && \
	  echo "/node_modules/" >> .gitignore && \
	  hub create -d "$2" && \
	  yarn init && \
	  gacp initial
}

## A whole pile of git aliases and functions:
alias gaa='git add --all -v'
alias gb='git branch'
alias gbls='git branch -av'
alias gcl='git clone'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gd='git diff'
alias gdoh='git diff origin HEAD'
alias gl='git log'
alias glg='git log --graph --pretty=format":%C(yellow)%h%Cblue%d%Creset %s %C(white) %an,%ar%Creset" --abbrev-commit --decorate'
alias glgh='git log --graph --pretty=format":%C(yellow)%h%Cblue%d%Creset %s %C(white) %an,%ar%Creset" --abbrev-commit --decorate | head'
alias glo='git log --oneline --decorate'
alias glog='git log'
alias gloh='git log --oneline --decorate | head'
alias gls='git ls-files'
alias gpl='git pull'
alias gploh='git pull origin HEAD'
alias gps='git push'
alias gpsoh='git push -u origin HEAD'
alias gpsfoh='git push -fu origin HEAD'
alias gpsfuoh='git push -fu origin HEAD'
alias gr='git remote'
alias grls='git remote -v'
alias gyolo='git add --all && git commit -m YOLO && git push -fu origin HEAD'


## I use this to make we-sized images in a "web" subdirectory
# Usage: mkweb *.png *.jpg [...]
alias mkweb='mkdir -p web; mogrify -verbose -path web -format jpg -resize 1024 -quality 60 '
