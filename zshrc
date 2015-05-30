# Custom completion
fpath=(~/.zsh/completion $fpath)

autoload -U compinit && compinit
autoload -U zmv
autoload colors && colors

source ~/.zsh/exports.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/history.zsh
source ~/.zsh/set_options.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/ssh.zsh
