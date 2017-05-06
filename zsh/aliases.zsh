######################
# Git
######################

alias to-prod="push origin master && co staging && git merge master && push origin staging && co production && git merge staging && push origin production"
function squash() { git rebase -i $(git merge-base HEAD origin/master) }

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
alias ls="ls -la -G"
alias s="subl ."

function pgrep {
  ps aux | grep $*
}

alias knockknock3000="lsof -i tcp:3000"
