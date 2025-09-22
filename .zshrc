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

# plugins

# last

zcomet load zsh-users/zsh-syntax-highlighting
zcomet compinit

