cat ~/.cache/wal/sequences

clear && fastfetch --config os

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

test -e "$HOME/.shellfishrc" && source "$HOME/.shellfishrc"
export PATH="$HOME/.cargo/bin:$PATH"

source ~/.cache/wal/colors-tty.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
