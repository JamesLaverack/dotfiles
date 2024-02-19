# Use Antigen to configure the shell
source $(brew --prefix)/share/antigen/antigen.zsh

# Oh my ZSH settings
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

# Run any local settings files
find "${HOME}/.config/zsh/local" -type f -name '*.zsh' 2>/dev/null | while IFS= read -r line ; do source $line; done

antigen apply

# TODO Use a ZSH plugin for this
eval "$(starship init zsh)"
