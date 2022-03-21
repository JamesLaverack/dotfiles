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
brew bundle cleanup --force

# Set Basic Settings
defaultbrowser firefox

# I prefer to use $HOME/github.com as a location for GitHub repositories
mkdir -p ${HOME}/github.com/
mkdir -p ${HOME}/Pictures/Screenshots/

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

