######################
# Git
######################

alias pull="git pull"
alias ci="git commit"
alias st="git status"
alias fetch="git fetch"
alias log="git log"
alias add="git add"
alias grc="git rebase --continue"
alias push="git push"

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

######################
# Heroku
######################

function ha() { heroku "$@" "-a" "$HEROKU_APP" }
function hs() { heroku "$@" "-a" "$HEROKU_STG_APP" }
function hp() { heroku "$@" "-a" "$HEROKU_PROD_APP" }
alias push-stg="git push staging develop:master"
alias push-prod="git push production master"

# Source .heroku-apps if it exists
function source_heroku_apps {
  if [ -e ".heroku-apps" ]; then
    source .heroku-apps
  fi
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

function th () {
  mv $* ~/.Trash
}

function pgrep {
  ps aux | grep $*
}

function internet\? {
  (ping -c 3 -t 3 google.com >/dev/null 2>&1 && echo 'yep') || echo 'nope'
}
