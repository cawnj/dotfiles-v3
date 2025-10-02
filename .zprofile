# xdg
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# brew
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX"
export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1

# path
typeset -aU path fpath
path=(
    $HOME/.asdf/shims(N/)
    $HOME/{.orbstack/bin,.local/bin}(N/)
    $HOMEBREW_PREFIX/opt/*/libexec/gnubin(N/)
    $HOMEBREW_PREFIX/{bin,sbin}(N/)
    $path
)
fpath=(
    /Applications/OrbStack.app/Contents/{MacOS,Resources}/completions/zsh(N/)
    $HOME/.granted/zsh_autocomplete/assume(N/)
    $HOMEBREW_PREFIX/share/zsh/site-functions
    $fpath
)

# config
export GPG_TTY="$TTY"
export EDITOR="vim"
export PAGER="less"
export MANPAGER="col -xbf | bat -p -l man"
export BAT_THEME="ansi"

export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type f --strip-cwd-prefix --hidden --follow --exclude .git"

