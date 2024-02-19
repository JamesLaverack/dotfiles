#!/usr/bin/env bash
echo "ℹ️  Setting up dotfiles"

if [[ $(uname -s) != "Darwin" ]]
then
  echo "❌ This system is not a macOS system, found: $(uname -s). Exiting."
  exit -1
fi

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null
then
  echo "🍺 Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "🍺 Homebrew Already Installed"
fi

dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ${dotfiles_dir}

# Install brew-managed software
echo "💻 Installing & updating brew-managed software"
brew bundle

# TMUX Package Manager
tmux_install_dir="${HOME}/.config/tmux/plugins/tpm"
if ! [ -d "${tmux_install_dir}" ]
then
  echo "🪟 Installing the tmux package manager"
  git clone https://github.com/tmux-plugins/tpm "${tmux_install_dir}"
else
  echo "🪟 tmux plugin manager already installed"
fi

# Set Basic Settings
echo "🌎 Setting Firefox as the default browser"
defaultbrowser firefox

mkdir_log() {
  echo "📁 Creating directory $1"
  mkdir -p $1
}

# Some useful directories
mkdir_log "${HOME}/github.com/"
mkdir_log "${HOME}/Pictures/Screenshots/"

# Symlink everything
link() {
  source="$1"
  target="$2"
  desc="$3"
  echo "🔗 Linking ${desc} (${target} → ${source})"
  ln -s -F -f "${source}" "${target}"
}

config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"

mkdir_log "${config_dir}/git"
link "${dotfiles_dir}/git-config" "${config_dir}/git/config" "Git Config File"
link "${dotfiles_dir}/git-global-ignore" "${config_dir}/git/global_gitignore" "Git Global Ignore File"
link "${dotfiles_dir}/isovalent/git-config" "${config_dir}/git/isovalent-config" "Git Isovalent Settings File"

mkdir_log "${HOME}/.gnupg"
link "${dotfiles_dir}/gpg-agent.conf" "${HOME}/.gnupg/gpg-agent.conf" "GNUPG Settings File"

mkdir_log "${config_dir}/alacritty"
link "${dotfiles_dir}/alacritty.yml" "${config_dir}/alacritty/alacritty.yml" "Alacritty Config File"
link "${dotfiles_dir}/alacritty-dracula-theme.toml" "${config_dir}/alacritty/dracula-theme.toml" "Alacritty 'Dracula' Theme File"

link "${dotfiles_dir}/nvim" "${config_dir}/nvim" "Neovim Config Directory"

mkdir_log "${config_dir}/tmux"
link "${dotfiles_dir}/tmux.conf" "${config_dir}/tmux/tmux.conf" "tmux Config File"

link "${dotfiles_dir}/zshrc" "${HOME}/.zshrc" "ZSH Config File"

mkdir_log "${config_dir}/tmux"
link "${dotfiles_dir}/starship.toml" "${config_dir}/starship.toml" "Starship Config File"

echo "🚀 Done"
