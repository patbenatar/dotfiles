######################
# Git
######################

alias to-prod="git push origin master && git checkout staging && git merge master && git push origin staging && git checkout production && git merge staging && git push origin production"
function squash() { git rebase -i $(git merge-base HEAD origin/master) }
alias gst="git status"
alias gd="git diff"
alias gup="git pull --rebase"
alias ga="git add"
alias gfo="git fetch origin"
alias gcam="git add . && git commit -a -m"
alias gcamn="git add . && git commit --no-verify -a -m"
alias clean-branches="git fetch -p && git branch -vv | grep ': gone]' | awk '{print $1}' | xargs git branch -D"

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
  rm -f latest.dump
}

######################
# Tmux
######################

alias ta="tmux attach-session -t"
alias tn="tmux new-session -s"
alias tl="tmux list-sessions"
alias tk="tmux kill-session -t"

######################
# Docker
######################

alias dc="docker-compose"
alias dcr="docker-compose run"
alias dcrw="docker-compose run web"
alias r="docker-compose run web rspec"

######################
# AWS
######################
alias aws-mfa="ruby ~/.util/aws_mfa.rb"
alias ecs-rails-c="~/.util/ecs_rails_c.sh"

######################
# Misc
######################

alias re-source="source ~/.zshrc"
alias ls="ls -la -G"

function pgrep {
  ps aux | grep $*
}

alias knockknock3000="lsof -i tcp:3000"

function startvirtualenv {
  export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2
  export WORKON_HOME=$HOME/.virtualenvs
  export PROJECT_HOME=$HOME/projects
  source /usr/local/bin/virtualenvwrapper.sh
}

if ! [ -x "$(command -v pbcopy)" ]; then
  alias pbcopy="xclip -sel clip"
fi
