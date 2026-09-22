# shell options
setopt auto_cd auto_pushd interactive_comments

# history in-memory only
unset HISTFILE
HISTSIZE=50000
setopt hist_ignore_dups hist_ignore_space

# completion
setopt complete_in_word always_to_end
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
autoload -Uz compinit bashcompinit && compinit -C && bashcompinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors 'di=33:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# editor
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

# vi mode
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
bindkey '^R' history-incremental-search-backward
bindkey '^X' undo
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# zoxide
eval "$(zoxide init zsh --cmd g)"

# yazi: cd to the directory you quit in
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# additional config
. ~/.colors
. ~/.aliases
[ -f ~/.localrc ] && . ~/.localrc

# starship prompt, keep last
eval "$(starship init zsh)"
