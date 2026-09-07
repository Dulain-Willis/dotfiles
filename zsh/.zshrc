
#eval "$(/opt/homebrew/bin/brew shellenv)"

alias ll='ls -lF'
export PATH="$HOME/.local/bin:$PATH"


alias ff='fastfetch'

# eza (ls replacement) config
alias ls="eza --icons" #keeps icons on permanently
alias ll="eza -lh --icons"
export EZA_CONFIG_DIR="$HOME/.config/eza" #sets directory you would like eza to look for config

#initializes custom command prompt from starship
eval "$(starship init zsh)"

bindkey -v
KEYTIMEOUT=10

bindkey -M viins 'jk' vi-cmd-mode

bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

function y() {
	local tmp cwd; tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
	command rm -f -- "$tmp"
}
