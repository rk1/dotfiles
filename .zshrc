export ZSH=/Users/rossen/.oh-my-zsh
ZSH_THEME="mrtazz"
plugins=(brew zshmarks zsh-completions)

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

source $ZSH/oh-my-zsh.sh

. ~/.colors
. ~/.aliases

if [ -f ~/.localrc ]; then
    . ~/.localrc
fi

unset HISTFILE
zstyle ':completion:*' list-colors 'di=33:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
bindkey '^R' history-incremental-search-backward
bindkey '^X' undo
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

alias -g A="| ag"
alias g="jump"
alias l="showmarks"
alias s="bookmark"
alias d="deletemark"

