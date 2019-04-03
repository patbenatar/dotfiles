# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source $HOME/.zsh/exports.zsh
source $HOME/.zsh/bootstrap.zsh
source $HOME/.zsh/completion.zsh
source $HOME/.zsh/history.zsh
source $HOME/.zsh/aliases.zsh
[ -s $HOME/.zsh/local.zsh ] && source $HOME/.zsh/local.zsh

#source ~/.philosophie-git/bootstrap
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
