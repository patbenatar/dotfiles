######################
# Git
######################

alias pull="git pull"
alias ci="git commit"
alias co="git checkout"
alias st="git status"
alias fetch="git fetch"
alias gfo="git fetch origin"
alias log="git log"
alias add="git add"
alias grc="git rebase --continue"
alias push="git push"
alias br="git branch"
alias gl="git log --graph --all --decorate"
alias diff="git diff"
alias squash="git rebase -i $(git merge-base HEAD origin/master)"
function cot() { git checkout -t "origin/$@" }
function nf() { git checkout -b "feature/$@" }

function gitrm {
  for i in `git status | grep deleted | awk '{print $3}'`; do git rm $i; done
}

# Git add all changes, commit.
function gac {
  if [ ! $# -eq 1 ]; then
    echo "Usage: gac <commit message>"
    return
  fi

  git add -A
  git commit -m "$1"
}

# Git pull and rebase
# Show git log if rebasing finds new changes
# You can optionally pass in a remote and branch
function gpr {
  output=`git pull --rebase $1 $2`
  echo $output
  if [[ $output != *is\ up\ to\ date\.* ]] then
    git log -n 3
  fi
}

# GitHub
alias ghpr="git pull-request"

######################
# Rails
######################

alias rlog="tail -f log/development.log"

function reload! () {
  touch tmp/restart.txt
}

# Restart pow from the command line
function boom {
  kill -9 `ps aux | awk '/Pow/ && !/awk/ { print $2 }'`
}

function bigboom {
  boom && rake db:drop db:create db:migrate db:seed
}

function pow {
  ln -s `pwd` ~/.pow/$1
}

######################
# Heroku
######################

function hs() { heroku "$@" "--remote" "staging" }
function hp() { heroku "$@" "--remote" "production" }
function hn() { heroku "$@" "--remote" "nightly" }
alias push-nightly="git push nightly master"
alias push-stg="git push staging staging:master"
alias push-prod="git push production production:master"

function pull-db() {
  hp pgbackups:capture --expire
  curl -o latest.dump `hp pgbackups:url`
  pg_restore --verbose --clean --no-acl --no-owner -h localhost -U `whoami` -d $@ latest.dump
  rm latest.dump
}

######################
# Tmux
######################

alias ta="tmux attach-session -t"
alias tn="tmux new-session -s"
alias tl="tmux list-sessions"
alias tk="tmux kill-session -t"

######################
# Projects
######################

# cd to the default working directory set by current_working_project
function cdefault {
  export wdir=`cat $HOME/bin/config/current_project_path`
  cd $wdir
}

function current_working_project {
  rm ~/bin/config/current_project_path
  pwd > ~/bin/config/current_project_path
}

######################
# Misc
######################

alias re-source="source ~/.zshrc"
alias ls="ls -la"
alias s="subl ."
alias pagekite="pagekite.py 3000 giantcola.pagekite.me"
alias lipsum="~/.lipsum"

function th () {
  mv $* ~/.Trash
}

function pgrep {
  ps aux | grep $*
}

function internet\? {
  (ping -c 3 -t 3 google.com >/dev/null 2>&1 && echo 'yep') || echo 'nope'
}
