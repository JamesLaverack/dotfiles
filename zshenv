export LANG=en_GB.UTF-8

# Without sourcing homebrew, we can't use any tools installed with Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew configuration
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_AUTO_UPDATE=1

# GPG Agent
GPG_TTY=$(tty)
export GPG_TTY
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# Vim config
export EDITOR=nvim
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

# Krew plugins
krew_bin="${KREW_ROOT:-$HOME/.krew}/bin"
if [ -d "$krew_bin" ] ; then
  export PATH="$PATH:$krew_bin"
fi

# Cilium configuration
if [ -n "$(command -v cilium)" ]; then
  export CILIUM_CLI_MODE="helm"
fi


# Go
export PATH="${PATH}:$(go env GOPATH)/bin"

