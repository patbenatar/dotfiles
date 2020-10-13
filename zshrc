# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source $HOME/.zsh/exports.zsh
source $HOME/.zsh/completion.zsh
source $HOME/.zsh/history.zsh
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/ros.zsh

[ -s $HOME/.zsh/local.zsh ] && source $HOME/.zsh/local.zsh
