if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# printf "virtualenv... "
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/projects
# source /usr/local/bin/virtualenvwrapper.sh

export NVM_LAZY_LOAD=true
source ~/.zsh-nvm/zsh-nvm.plugin.zsh
