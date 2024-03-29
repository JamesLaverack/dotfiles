export LANG=en_GB.UTF-8

# Without sourcing homebrew, we can't use any of it's tools
eval "$(/opt/homebrew/bin/brew shellenv)"

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

# Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:${PATH}"

# Homebrew
export HOMEBREW_NO_INSTALL_CLEANUP=1

# Cilium
export CILIUM_CLI_MODE="helm"

# Go
export PATH="${PATH}:$(go env GOPATH)/bin"

