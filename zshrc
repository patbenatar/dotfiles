export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git ssh-agent)

source $ZSH/oh-my-zsh.sh

# Personal...
source $HOME/.zsh/exports.zsh
source $HOME/.zsh/bootstrap.zsh
source $HOME/.zsh/completion.zsh
source $HOME/.zsh/history.zsh
source $HOME/.zsh/aliases.zsh
[ -s $HOME/.zsh/local.zsh ] && source $HOME/.zsh/local.zsh
