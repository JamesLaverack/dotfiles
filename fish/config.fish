# Language
set -gx LANG en_GB.UTF-8

# Homebrew
set -gx HOMEBREW_NO_INSTALL_CLEANUP 1
set -gx HOMEBREW_NO_AUTO_UPDATE 1

# GPG Agent
set -gx GPG_TTY $(tty)
set -e SSH_AGENT_PID
if command -q gpgconf
  set SSH_AUTH_SOCK $(gpgconf --list-dir agent-ssh-socket)
end

# Kubernetes
if command -q kubectl
  abbr -a k kubectl
  kubectl completion fish | source
  if command -q kubecolor
    abbr -a kubecolour kubecolor
    function kubectl --wraps kubectl
      command kubecolor $argv
    end
    function kubecolor --wraps kubectl
      command kubecolor $argv
    end
  end
end

# Rust
set rust_bin "$HOME/.cargo/bin"
if test -d $rust_bin
  fish_add_path -a $rust_bin
end

# Cilium
if command -q cilium
  set -gx CILIUM_CLI_MODE helm
end

if status is-interactive
  # Neovim
  abbr -a vim nvim
  abbr -a vi nvim
  set -gx EDITOR nvim
end

