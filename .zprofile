export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export GPG_TTY=${TTY}

export EDITOR=vim
export PAGER=less

export HOMEBREW_PREFIX="/opt/homebrew"
typeset -aU path
path=(
  "${HOME}/.local/bin"
  "${HOME}/.asdf/shims"
  "${HOMEBREW_PREFIX}/bin"
  "${HOMEBREW_PREFIX}/sbin"
  $path
)
typeset -aU fpath
fpath=(
  "${HOMEBREW_PREFIX}/share/zsh/site-functions"
  $fpath
)
typeset -aU manpath
manpath=(
  "${HOMEBREW_PREFIX}/share/man"
  $manpath
)

