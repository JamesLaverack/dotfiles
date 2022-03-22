#!/usr/bin/env bash

echo "ℹ️ This script installs things on macOS. It is idempotent, and safe to re-run."

# Install Homebrew if not already installed
echo "🍺 Installing Homebrew"
if ! command -v brew &> /dev/null
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ${dotfiles_dir}

# Install brew-managed software
echo "💻 Installing & updating brew-managed software"
brew bundle

# Set Basic Settings
echo "🌎 Setting Firefox as the default browser"
defaultbrowser firefox

echo "📁 Creating useful directories"
mkdir -p ${HOME}/github.com/
mkdir -p ${HOME}/Pictures/Screenshots/
mkdir -p ${HOME}/.gnupg/

# Symlink everything

echo "🔗 Symlinking config files"
git_config_dir="${HOME}/.config/git"
if ! [ -L "${git_config_dir}" ]
then
  rm -r "${git_config_dir}" || true
  ln -s "${dotfiles_dir}/git" "${git_config_dir}"
  echo "Linked git config"
else
  echo "git config symlink exists"
fi

gnupg_config_file="${HOME}/.gnupg/gpg-agent.conf"
if ! [ -L "${gnupg_config_file}" ]
then
  rm -r "${gnupg_config_file}" || true
  ln -s "${dotfiles_dir}/gpg-agent.conf" "${gnupg_config_file}"
  echo "Linked gnupg config"
else
  echo "gnupg config symlink exists"
fi

alacritty_config_file="${HOME}/.config/alacritty/alacritty.yml"
mkdir -p "$(dirname ${alacritty_config_file})"
if ! [ -L "${alacritty_config_file}" ]
then
  rm -r "${alacritty_config_file}" || true
  ln -s "${dotfiles_dir}/alacritty.yml" "${alacritty_config_file}"
  echo "Linked Alacritty config"
else
  echo "Alacritty config symlink exists"
fi

alacritty_theme_file="${HOME}/.config/alacritty/dracula-theme.yml"
mkdir -p "$(dirname ${alacritty_theme_file})"
if ! [ -L "${alacritty_theme_file}" ]
then
  rm -r "${alacritty_theme_file}" || true
  ln -s "${dotfiles_dir}/alacritty-dracula-theme.yml" "${alacritty_theme_file}"
  echo "Linked Alacritty theme"
else
  echo "Alacritty theme symlink exists"
fi

neovim_config_file="${HOME}/.config/nvim/init.vim"
mkdir -p "$(dirname ${neovim_config_file})"
if ! [ -L "${neovim_config_file}" ]
then
  rm -r "${neovim_config_file}" || true
  ln -s "${dotfiles_dir}/neovim.vim" "${neovim_config_file}"
  echo "Linked Neovim config"
else
  echo "Neovim config symlink exists"
fi

zsh_config_file="${HOME}/.zshrc"
if ! [ -L "${zsh_config_file}" ]
then
  rm -r "${zsh_config_file}" || true
  ln -s "${dotfiles_dir}/zshrc" "${zsh_config_file}"
  echo "Linked zsh config"
else
  echo "zsh config symlink exists"
fi

echo "🚀 Done"
