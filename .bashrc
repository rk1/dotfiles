# General
if [[ $OSTYPE = darwin* ]]; then
    export CLICOLOR=1
    export LSCOLORS=dxfxcxdxbxegedabagacad
    alias ls='ls -CFG'
else
    alias ls='ls --color=auto'
    eval `dircolors ~/.dircolors`
fi


if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi
if [ -f ~/.bin/bashmarks.sh ]; then source ~/.bin/bashmarks.sh; fi

if [[ -x /usr/local/bin/brew && -f `brew --prefix`/etc/bash_completion ]]; then
    . `brew --prefix`/etc/bash_completion
fi
if [[ -x /usr/local/bin/brew && -f $(brew --prefix)/share/bash-completion/bash_completion ]]; then
    . $(brew --prefix)/share/bash-completion/bash_completion
 fi

PS1="\u@\w:"
export PS1

if [ -f ~/.localrc ]; then
  . ~/.localrc
fi

