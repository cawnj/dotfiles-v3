# shell
export GPG_TTY=$TTY
export EDITOR=vim
export PAGER=less
export MANPAGER="col -xbf | bat -p -l man"
export BAT_THEME=ansi

# brew
export HOMEBREW_PREFIX=/opt/homebrew
export HOMEBREW_REPOSITORY=$HOMEBREW_PREFIX
export HOMEBREW_CELLAR=$HOMEBREW_PREFIX/Cellar
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1

# fzf
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

# sdkman
export SDKMAN_DIR=$HOMEBREW_PREFIX/opt/sdkman-cli/libexec

# pnpm
export PNPM_HOME="$XDG_DATA_HOME/pnpm"

# path
typeset -aU path fpath
path=(
    $HOME/{.local/bin,.orbstack/bin}(N/)
    $HOME/{.local/share/pnpm,.asdf/shims}(N/)
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
