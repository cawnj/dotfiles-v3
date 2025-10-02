# zcomet
if [[ ! -f $HOME/.zcomet/bin/zcomet.zsh ]]; then
    git clone https://github.com/agkozak/zcomet.git $HOME/.zcomet/bin
fi
source $HOME/.zcomet/bin/zcomet.zsh

# plugins
zcomet load romkatv/zsh-bench
export PATH="/Users/cj-test/.zcomet/repos/romkatv/zsh-bench:$PATH"

zcomet load romkatv/powerlevel10k
source $HOME/.p10k.zsh

zcomet load romkatv/zsh-defer
zcomet load romkatv/zsh-no-ps2

zcomet snippet OMZ::lib/key-bindings.zsh
zcomet snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh
zcomet load junegunn/fzf shell key-bindings.zsh

zcomet load zsh-users/zsh-completions
zcomet load junegunn/fzf shell completion.zsh
zcomet snippet OMZ::lib/git.zsh
zsh-defer zcomet snippet OMZ::plugins/git/git.plugin.zsh

zsh-defer zcomet compinit
zsh-defer zcomet load Aloxaf/fzf-tab
zsh-defer zcomet snippet OMZ::plugins/zoxide/zoxide.plugin.zsh
zsh-defer zcomet load zdharma-continuum/fast-syntax-highlighting

# config
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY

zstyle ":completion:*" use-cache on
zstyle ":completion:*" cache-path "$XDG_CACHE_HOME/.zcompcache"

alias ls="ls --color=auto"
alias ll="ls -la"

