export MANPATH=/opt/local/share/man:$MANPATH
export PATH=$HOME/.pilot/bin:$HOME/bin:$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/heroku/bin:$PATH
export CDPATH=~/Projects:~/
export RUBYOPT='rubygems'
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'
export EDITOR='subl -w'
export TERM=xterm-color
export LSCOLORS=gxfxcxdxbxegedabagacad
export CLICOLOR=1
export NODE_PATH="/usr/local/bin/node:/usr/local/lib/node_modules"
export RUBYGEMS_GEMDEPS="-"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pilot > /dev/null; then eval "$(pilot init -)"; fi
