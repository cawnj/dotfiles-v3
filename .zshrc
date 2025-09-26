if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi
source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh
zcomet load romkatv/powerlevel10k
source ${ZDOTDIR:-${HOME}}/.p10k.zsh

zcomet snippet OMZ::plugins/git/git.plugin.zsh
zcomet snippet https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh
zcomet load Freed-Wu/fzf-tab-source

zcomet snippet https://github.com/junegunn/fzf/blob/master/shell/completion.zsh
zcomet load zsh-users/zsh-completions
zcomet compinit

zcomet load Aloxaf/fzf-tab
zcomet load zdharma-continuum/fast-syntax-highlighting

HISTFILE=${ZDOTDIR:-${HOME}}/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY

bindkey -v
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

