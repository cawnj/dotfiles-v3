# first

if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

# zcomet and p10k

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh
zcomet load romkatv/powerlevel10k
source ${ZDOTDIR:-${HOME}}/.p10k.zsh

# history

HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY

# plugins

zcomet fpath zsh-users/zsh-completions

# last

zcomet load zdharma-continuum/fast-syntax-highlighting
zcomet compinit

