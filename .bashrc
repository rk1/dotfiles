. ~/.colors
. ~/.aliases
. ~/.bash_config

PS1="\u@\w:"
export PS1

if [ -f ~/.localrc ]; then
  . ~/.localrc
fi

