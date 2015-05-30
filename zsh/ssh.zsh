export SSH_ENV=$HOME/.ssh/environment

function start_agent() {
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > $SSH_ENV
  chmod 600 $SSH_ENV
  . $SSH_ENV
  /usr/bin/ssh-add
}

start_agent 2> /dev/null # Suppress output (no need to see it!)
