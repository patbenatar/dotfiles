if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

function loadnvm {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}
