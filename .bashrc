# General
if [[ $OSTYPE = darwin* ]]; then
    export CLICOLOR=1
    export LSCOLORS=dxfxcxdxbxegedabagacad
    alias ls='ls -CFG'
else
    alias ls='ls --color=auto'
    eval 'dircolors ~/.dircolors'
fi
alias la='ls -hAlFiG'
alias li='ls -hAlFiG'
alias ll="ls -logh"
alias rm="rm -i"
alias grep="grep -i"
alias downcase="rename 'y/A-Z/a-z/' * -f"
# annoying parallels leftovers
alias rmwin="rm -rf *RECYCLE*BIN* Thumbs.db"
alias op="open"
alias cl="clear"
alias cll="clear; ll"
alias ..="cd .."
alias ...='cd ../../'
alias ....='cd ../../../'
alias -- -='cd -'
alias newip="sudo ipconfig set en0 BOOTP;sudo ipconfig set en0 DHCP"

# Applications
alias f="open . -a finder"
alias photoshop="open -a Adobe\ Photoshop\ CS6"
alias lightroom="open -a Adobe\ Lightroom\ 3"
alias vi="mvim"
alias fw="open -a Adobe\ Fireworks\ CS6"
alias ql="qlmanage -p"
alias cal='gcal --starting-day=1'
alias sf="open -a Safari"
alias wr='open -a "iA Writer"'
alias vlc="open -a vlc"

# Directories
alias dsk="cd ~/Desktop/"
alias doc="cd ~/Documents/"
alias dw="cd ~/Downloads/"
alias mov="cd ~/Movies/"
alias vl="cd /Volumes/"
alias acl="cd '/Volumes/Clients/'"
alias ath="cd ~/Documents/athlon/"

mkcd () { mkdir -p "$@" && cd "$@"; }

eval "$(rbenv init - --no-rehash)"

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# user bin
export PATH=${HOME}/.bin:$PATH

alias t="todo.sh -nv"
complete -F _todo t

source ~/.bin/bashmarks.sh

PS1="rossen@\w:"
export PS1   

printf "\ec"

