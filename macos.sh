#!/usr/bin/env bash

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ${dotfiles_dir}

# Install brew-managed software
brew bundle

# Set Basic Settings
defaultbrowser firefox

# I prefer to use $HOME/github.com as a location for GitHub repositories
mkdir -p ${HOME}/github.com/
mkdir -p ${HOME}/Pictures/Screenshots/
mkdir -p ${HOME}/.gnupg/

# Symlink everything

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


alacritty_config_dir="${HOME}/.config/alacritty"
if ! [ -L "${alacritty_config_dir}" ]
then
  rm -r "${alacritty_config_dir}" || true
  ln -s "${dotfiles_dir}/alacritty" "${alacritty_config_dir}"
  echo "Linked Alacritty config"
else
  echo "Alacritty config symlink exists"
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
