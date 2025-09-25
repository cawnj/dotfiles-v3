if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh
zcomet load romkatv/powerlevel10k
source ${ZDOTDIR:-${HOME}}/.p10k.zsh

zcomet load ohmyzsh plugins/git
zcomet load ohmyzsh plugins/gitfast
zcomet load jeffreytse/zsh-vi-mode
zcomet load junegunn/fzf shell/{completion,key-bindings}.zsh
zcomet load Freed-Wu/fzf-tab-source

zcomet fpath zsh-users/zsh-completions
zcomet compinit

zcomet load Aloxaf/fzf-tab
zcomet load zdharma-continuum/fast-syntax-highlighting

HISTFILE=${ZDOTDIR:-${HOME}}/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

