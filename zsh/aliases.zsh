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
function squash() { git rebase -i $(git merge-base HEAD origin/master) }
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

######################
# Heroku
######################
function hs() { heroku "$@" "--app" `~/.util/heroku_app_name.rb staging` }
function hp() { heroku "$@" "--app" `~/.util/heroku_app_name.rb production` }
alias push-stg="git push staging staging:master"
alias push-prod="git push production production:master"

function pull-db() {
  hp pg:backups capture
  curl -o latest.dump `hp pg:backups public-url`
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
# Node
######################

alias npm-exec='PATH=$(npm bin):$PATH'

######################
# Misc
######################

alias re-source="source ~/.zshrc"
alias ls="ls -la"
alias s="subl ."

function pgrep {
  ps aux | grep $*
}
