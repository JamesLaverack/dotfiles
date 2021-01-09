#!/usr/bin/env bash

# Setup for MacOS

# Install Homebrew
if ! command -v brew &> /dev/null
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Install utilities and applications
brew install $(cat "${dotfiles_dir}/package/brew.txt")
brew install --cask $(cat "${dotfiles_dir}/package/brew-cask.txt")

# Install Oh My ZSH
if [[ ! -d "$HOME/.oh-my-zsh" ]]
then
    echo "Oh My ZSH not installed, running installer…"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My ZSH already installed"
fi

# Oh My ZSH Custom directory
echo "Ensuring Oh My ZSH custom directory exists"
custom_zsh_dir="$HOME/.zsh-custom"
mkdir -p "${custom_zsh_dir}/themes"

# Install Spacemacs
if [[ ! -d "$HOME/.emacs.d" ]]
then
    echo "Spacemacs not installed, running installer…"
    git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d
else
    echo "Spacemacs already installed"
fi

# I prefer to use $HOME/github.com as a location for GitHub repositories
mkdir -p $HOME/github.com/JamesLaverack

# Bernkastel ZSH Theme
bernkastel_repo="$HOME/github.com/JamesLaverack/bernkastel"
if [[ ! -d ${bernkastel_repo} ]]
then
    echo "Installing ZSH Bernkastel theme"
    git clone git@github.com:JamesLaverack/bernkastel.git "${bernkastel_repo}"
else
    echo "Bernkastel already installed"
fi

# Link the Bernkastel theme into the custom Oh My ZSH theme directory
bernkastel_theme_file="${custom_zsh_dir}/themes/bernkastel.zsh-theme"
if [[ ! -h ${bernkastel_theme_file} ]]
then
    echo "Syslinking Bernkastel theme into Oh My ZSH custom directory"
    ln -s "${bernkastel_repo}/bernkastel.zsh-theme" "${bernkastel_theme_file}"
else
    echo "Berkastel theme already syslinked into Oh My ZSH custom directory"
fi

# Install Fonts
fonts_dir="$HOME/Library/Fonts"
wget -nc https://github.com/adobe-fonts/source-code-pro/releases/download/variable-fonts/SourceCodeVariable-Roman.otf --directory-prefix "${fonts_dir}"
wget -nc https://github.com/adobe-fonts/source-code-pro/releases/download/variable-fonts/SourceCodeVariable-Italic.otf --directory-prefix "${fonts_dir}"
