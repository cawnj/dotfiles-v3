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
zcomet fpath zsh-users/zsh-completions src
zcomet snippet OMZ::lib/history.zsh
zcomet snippet OMZ::lib/key-bindings.zsh
zcomet snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh
zcomet snippet OMZ::plugins/fzf/fzf.plugin.zsh
zcomet snippet OMZ::plugins/git/git.plugin.zsh
zcomet snippet OMZ::plugins/zoxide/zoxide.plugin.zsh

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_ALT_C_COMMAND='fd --type d --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
_fzf_compgen_path() { fd --type f --hidden --follow --exclude .git . $1 }
_fzf_compgen_dir() { fd --type d --hidden --follow --exclude .git . $1 }
fe() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0 --preview="bat --color=always {}"))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# completions
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${LS_COLORS-}"

# aliases
alias cd="z"
alias ls="ls --color=auto"

# load last
zcomet compinit
zcomet load Aloxaf/fzf-tab
zcomet load zdharma-continuum/fast-syntax-highlighting

