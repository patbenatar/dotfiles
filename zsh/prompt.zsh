autoload colors

git_branch() {
  echo -ne $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$(git st 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ $st == "nothing to commit (working directory clean)" ]]
    then
      echo ""
    else
      echo "*"
    fi
  fi
}

git_prompt_info () {
 ref=$(git symbolic-ref HEAD 2>/dev/null) || return
 echo "(%{\e[0;35m%}${ref#refs/heads/}%{\e[0m%})"
}

unpushed () {
  git cherry -v origin/$(git_branch) 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo ""
  else
    echo "%{\e[0;33m%}$%{\e[0m%}"
  fi
}

# export PROMPT=$'%{$fg[red]%}$(ruby_version) %{\e[0;33m%}%2/%{\e[0m%}/ '
export PROMPT=$'%{\e[0;33m%}%1/%{\e[0m%}/ '
export RPROMPT=$'$(git_prompt_info)$(git_dirty)$(need_push)'
set_prompt () {
  export RPROMPT="$(git_prompt_info)$(git_dirty)$(need_push)"
}

precmd() {
  print -Pn "\e]0;%~\a"
  set_prompt
}
