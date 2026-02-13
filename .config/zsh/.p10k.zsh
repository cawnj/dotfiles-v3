source ~[powerlevel10k]/config/p10k-lean-8colors.zsh

typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  # =========================[ Line #1 ]=========================
  # os_icon               # os identifier
  dir                     # current directory
  vcs                     # git status
  # =========================[ Line #2 ]=========================
  newline                 # \n
  prompt_char             # prompt symbol
)

typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  # =========================[ Line #1 ]=========================
  status                  # exit code of the last command
  command_execution_time  # duration of the last command
  background_jobs         # presence of background jobs
  pulumi                  # pulumi stack (https://www.pulumi.com/)
  aws                     # aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)
  asdf                    # asdf version manager (https://github.com/asdf-vm/asdf)
  dotnet_version          # .NET version (https://dotnet.microsoft.com)
  # direnv                # direnv status (https://direnv.net/)
  # virtualenv            # python virtual environment (https://docs.python.org/3/library/venv.html)
  # anaconda              # conda environment (https://conda.io/)
  # pyenv                 # python environment (https://github.com/pyenv/pyenv)
  # goenv                 # go environment (https://github.com/syndbg/goenv)
  # nodenv                # node.js version from nodenv (https://github.com/nodenv/nodenv)
  # nvm                   # node.js version from nvm (https://github.com/nvm-sh/nvm)
  # nodeenv               # node.js environment (https://github.com/ekalinin/nodeenv)
  # node_version          # node.js version
  # go_version            # go version (https://golang.org)
  # rust_version          # rustc version (https://www.rust-lang.org)
  # php_version           # php version (https://www.php.net/)
  # laravel_version       # laravel php framework version (https://laravel.com/)
  # java_version          # java version (https://www.java.com/)
  # package               # name@version from package.json (https://docs.npmjs.com/files/package.json)
  # rbenv                 # ruby version from rbenv (https://github.com/rbenv/rbenv)
  # rvm                   # ruby version from rvm (https://rvm.io)
  # fvm                   # flutter version management (https://github.com/leoafarias/fvm)
  # luaenv                # lua version from luaenv (https://github.com/cehoffman/luaenv)
  # jenv                  # java version from jenv (https://github.com/jenv/jenv)
  # plenv                 # perl version from plenv (https://github.com/tokuhirom/plenv)
  # perlbrew              # perl version from perlbrew (https://github.com/gugod/App-perlbrew)
  # phpenv                # php version from phpenv (https://github.com/phpenv/phpenv)
  # scalaenv              # scala version from scalaenv (https://github.com/scalaenv/scalaenv)
  # haskell_stack         # haskell version from stack (https://haskellstack.org/)
  # kubecontext           # current kubernetes context (https://kubernetes.io/)
  # terraform             # terraform workspace (https://www.terraform.io)
  # terraform_version     # terraform version (https://www.terraform.io)
  # aws_eb_env            # aws elastic beanstalk environment (https://aws.amazon.com/elasticbeanstalk/)
  # azure                 # azure account name (https://docs.microsoft.com/en-us/cli/azure)
  # gcloud                # google cloud cli account and project (https://cloud.google.com/)
  # google_app_cred       # google application credentials (https://cloud.google.com/docs/authentication/production)
  # toolbox               # toolbox name (https://github.com/containers/toolbox)
  # context               # user@hostname
  # nordvpn               # nordvpn connection status, linux only (https://nordvpn.com/)
  # ranger                # ranger shell (https://github.com/ranger/ranger)
  # yazi                  # yazi shell (https://github.com/sxyazi/yazi)
  # nnn                   # nnn shell (https://github.com/jarun/nnn)
  # lf                    # lf shell (https://github.com/gokcehan/lf)
  # xplr                  # xplr shell (https://github.com/sayanarijit/xplr)
  # vim_shell             # vim shell indicator (:sh)
  # midnight_commander    # midnight commander shell (https://midnight-commander.org/)
  # nix_shell             # nix shell (https://nixos.org/nixos/nix-pills/developing-with-nix-shell.html)
  # chezmoi_shell         # chezmoi shell (https://www.chezmoi.io/)
  # vpn_ip                # virtual private network indicator
  # load                  # CPU load
  # disk_usage            # disk usage
  # ram                   # free RAM
  # swap                  # used swap
  # todo                  # todo items (https://github.com/todotxt/todo.txt-cli)
  # timewarrior           # timewarrior tracking status (https://timewarrior.net/)
  # taskwarrior           # taskwarrior task count (https://taskwarrior.org/)
  # per_directory_history # Oh My Zsh per-directory-history local/global indicator
  # cpu_arch              # CPU architecture
  # time                  # current time
  # =========================[ Line #2 ]=========================
  newline                 # \n
  # ip                    # ip address and bandwidth usage for a specified network interface
  # public_ip             # public IP address
  # proxy                 # system-wide http/https/ftp proxy
  # battery               # internal battery
  # wifi                  # wifi speed
  # example               # example user-defined segment (see prompt_example function below)
)

typeset -g POWERLEVEL9K_MODE=nerdfont-v3
typeset -g POWERLEVEL9K_DIR_CLASSES=()
typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION=
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION=
typeset -g POWERLEVEL9K_TIME_VISUAL_IDENTIFIER_EXPANSION=
typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

unset POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND
unset POWERLEVEL9K_AWS_SHOW_ON_COMMAND
unset POWERLEVEL9K_AZURE_SHOW_ON_COMMAND
unset POWERLEVEL9K_GCLOUD_SHOW_ON_COMMAND
unset POWERLEVEL9K_GOOGLE_APP_CRED_SHOW_ON_COMMAND

typeset -g POWERLEVEL9K_AWS_CONTENT_EXPANSION='${P9K_AWS_PROFILE//\%/%%}'

typeset -g POWERLEVEL9K_VCS_MAX_SYNC_LATENCY_SECONDS=0.003

# ---------------
# custom segments
# ---------------

typeset -g POWERLEVEL9K_PULUMI_FOREGROUND='magenta'
typeset -g POWERLEVEL9K_PULUMI_VISUAL_IDENTIFIER_EXPANSION=''
typeset -g _p10k_pulumi_stack= _p10k_pulumi_dir=$PWD
_p10k_pulumi_async() {
  cd $1
  export AWS_PROFILE=$2
  pulumi stack --show-name
}
_p10k_pulumi_callback() {
  # echo "_p10k_pulumi_callback: jobName=$1, returnCode=$2, stdout=$3, executionTime=$4, stderr=$5, hasNextResult=$6" >> /tmp/p10k-pulumi.log
  _p10k_pulumi_stack="$3"
  p10k display -r
}
prompt_pulumi() {
  emulate -L zsh -o extended_glob
  (( $+commands[pulumi] )) || return 1
  [[ -f Pulumi.yaml || -f Pulumi.yml ]] || return 1
  async_job _p10k_pulumi_worker _p10k_pulumi_async $PWD $AWS_PROFILE
  [[ $_p10k_pulumi_dir == $PWD ]] || {
    _p10k_pulumi_stack=
    _p10k_pulumi_dir=$PWD
  }
  p10k segment -e -t '$_p10k_pulumi_stack'
}
async_stop_worker         _p10k_pulumi_worker
async_start_worker        _p10k_pulumi_worker -u
async_unregister_callback _p10k_pulumi_worker
async_register_callback   _p10k_pulumi_worker _p10k_pulumi_callback
