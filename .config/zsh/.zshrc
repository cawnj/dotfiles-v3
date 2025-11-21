# instant prompt
source $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh

# zcomet
if [[ ! -f $ZDOTDIR/.zcomet/bin/zcomet.zsh ]]; then
    git clone https://github.com/agkozak/zcomet.git $ZDOTDIR/.zcomet/bin
fi
source $ZDOTDIR/.zcomet/bin/zcomet.zsh

# p10k
zcomet load mafredri/zsh-async
zcomet load romkatv/powerlevel10k
source $ZDOTDIR/.p10k.zsh

# plugins
zcomet load romkatv/zsh-defer
zcomet load romkatv/zsh-no-ps2

zcomet snippet OMZ::lib/key-bindings.zsh
zcomet snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh
zcomet load junegunn/fzf@v0.65.2 shell key-bindings.zsh

zcomet load zsh-users/zsh-completions
zcomet load junegunn/fzf@v0.65.2 shell completion.zsh
zcomet snippet OMZ::lib/git.zsh
zsh-defer zcomet snippet OMZ::plugins/git/git.plugin.zsh

zsh-defer zcomet compinit
zsh-defer zcomet load Aloxaf/fzf-tab
zsh-defer zcomet snippet OMZ::plugins/zoxide/zoxide.plugin.zsh
zsh-defer zcomet load zdharma-continuum/fast-syntax-highlighting

# tools
zsh-defer source "$SDKMAN_DIR/bin/sdkman-init.sh"
zsh-defer source "$HOME/.asdf/plugins/java/set-java-home.zsh"

# history
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=1000000000
SAVEHIST=1000000000
setopt extended_history
setopt share_history

# completions
zstyle ":completion:*" use-cache on
zstyle ":completion:*" cache-path "$XDG_CACHE_HOME/.zcompcache"

# aliases
alias ls="ls --color=auto"
alias ll="ls -la"
alias assume=". assume" # common-fate/granted
