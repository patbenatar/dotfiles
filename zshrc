# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source $HOME/.zsh/exports.zsh
source $HOME/.zsh/completion.zsh
source $HOME/.zsh/history.zsh
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/ros.zsh
source /usr/local/share/chruby/chruby.sh

[ -s $HOME/.zsh/local.zsh ] && source $HOME/.zsh/local.zsh

# fnm
FNM_PATH="/home/nick/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/nick/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# fnm
FNM_PATH="/home/nick/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/nick/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
