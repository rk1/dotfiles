alias ls='ls -CFG'
alias la='ls -hAlFiG'
alias li='ls -hAlFiG'
alias ll="ls -log"
alias rm="rm -i"
alias rmdir="rm -ir"
alias grep="grep -i"
# annoying parallels leftovers
alias rmwin="rm -rf *RECYCLE*BIN* Thumbs.db"
alias op="open"
alias cl="clear"
alias cll="clear; ll"
alias pwdc="pwd | pbcopy"
alias ..="cd .."
alias ...='cd ../../'
alias ....='cd ../../../'
alias -- -='cd -'
alias newip="sudo ipconfig set en0 BOOTP;sudo ipconfig set en0 DHCP"

# Applications
alias f="open . -a finder"
alias sk="open -a skype"
alias photoshop="open -a Adobe\ Photoshop\ CS6"
alias lightroom="open -a Adobe\ Lightroom\ 3"
alias vi="mvim"
alias fw="open -a Adobe\ Fireworks\ CS6"
alias tm="open -a textmate"
alias ql="qlmanage -p"
alias sf="open -a Safari"
alias wr='open -a "iA Writer"'
alias vlc="open -a vlc"

# Directories
alias dsk="cd ~/Desktop/"
alias doc="cd ~/Documents/"
alias dw="cd ~/Downloads/"
alias mov="cd ~/Movies/"
alias vl="cd ~/../../Volumes/"
alias acl="cd '/Volumes/Clients/'"
alias ath="cd ~/Documents/athlon/"
alias uni="cd ~/Documents/uni_and_stuff/"

source ~/.local/bin/bashmarks.sh

mkcd () { mkdir -p "$@" && cd "$@"; }

export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'

# ruby 1.9
eval "$(rbenv init -)"

# svn 1.7
export PATH=/usr/local/Cellar/subversion/1.7.5/bin:$PATH

# git bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# android sdk
export PATH=/Applications/android-sdk-macosx/platform-tools:$PATH

# araxis command line tools
export PATH="$PATH:/Applications/AraxisMerge.app/Utilities"

alias ctags="`brew --prefix`/bin/ctags"

PS1="rossen@\w:"
export PS1   

# ls colors
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

printf "\ec"

