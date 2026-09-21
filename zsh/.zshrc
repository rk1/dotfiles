export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

unset HISTFILE          # keep history in-memory for this session
HISTSIZE=50000
setopt auto_cd auto_pushd interactive_comments complete_in_word always_to_end
setopt hist_ignore_dups hist_ignore_space

# completion
fpath=(/opt/homebrew/share/zsh/site-functions ~/.zsh/zshmarks $fpath)
autoload -Uz compinit bashcompinit && compinit -C && bashcompinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors 'di=33:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# vi mode
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
bindkey '^R' history-incremental-search-backward
bindkey '^X' undo
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# zshmarks (git submodule)
source ~/.zsh/zshmarks/zshmarks.plugin.zsh
alias g="jump" l="showmarks" s="bookmark" d="deletemark"

# zoxide
eval "$(zoxide init zsh)"

# yazi: cd to the directory you quit in
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

. ~/.colors
. ~/.aliases
[ -f ~/.localrc ] && . ~/.localrc

# prompt: starship (brew "starship"), config in ~/.config/starship.toml
eval "$(starship init zsh)"
