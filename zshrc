# Oh My ZSH configuration
source $(brew --prefix)/share/antigen/antigen.zsh

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

antigen use oh-my-zsh

antigen bundle git
antigen bundle kubectl
antigen bundle terraform
antigen bundle colored-man-pages
antigen bundle rust
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions

# GPG Agent
GPG_TTY=$(tty)
export GPG_TTY

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export LANG=en_GB.UTF-8

# Vim config
export EDITOR=nvim
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

antigen apply

# TODO Use a ZSH plugin for this
eval "$(starship init zsh)"
