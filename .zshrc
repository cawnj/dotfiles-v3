# instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zcomet
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi
source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

# p10k
zcomet load romkatv/powerlevel10k
source ${ZDOTDIR:-${HOME}}/.p10k.zsh

# plugins
zcomet snippet OMZ::plugins/git/git.plugin.zsh
zcomet snippet https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh
zcomet snippet https://github.com/junegunn/fzf/blob/master/shell/completion.zsh
zcomet fpath zsh-users/zsh-completions src

# config

## history
HISTFILE=${ZDOTDIR:-${HOME}}/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY

## keybinds
bindkey -v
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

## fzf
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
_fzf_compgen_path() {
  fd --type f --hidden --follow --exclude .git . $1
}
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude .git . $1
}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
zstyle ':fzf-tab:complete:*:options' fzf-preview
zstyle ':fzf-tab:complete:*:argument-1' fzf-preview

## aliases
alias cd="z"

# load last
zcomet compinit
eval "$(zoxide init zsh)"
zcomet load Aloxaf/fzf-tab
zcomet load zdharma-continuum/fast-syntax-highlighting

