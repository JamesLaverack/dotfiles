#!/usr/bin/env fish

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
  # Add the bin directory used by `cargo install` to the PATH
  fish_add_path -a $rust_bin
end

# Go
if command -q go
  # Add the "GOBIN" to the PATH
  if test "$(go env GOBIN)" = ''
    fish_add_path -a "$(go env GOPATH)/bin"
  else
    fish_add_path -a "$(go env GOBIN)"
  end
end

# Cilium
if command -q cilium
  # Instruct Cilium CLI to always use the Helm installation mode
  set -gx CILIUM_CLI_MODE helm
end

# Use Neovim as editor in interactive mode
if status is-interactive
  # Neovim
  abbr -a vim nvim
  abbr -a vi nvim
  set -gx EDITOR nvim
end

# Disable Fish greeting
set -g fish_greeting

