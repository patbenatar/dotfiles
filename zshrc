# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git z history-substring-search docker docker-compose aws)
source $ZSH/oh-my-zsh.sh

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
