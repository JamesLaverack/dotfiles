#!/usr/bin/env bash

# Setup for MacOS

# Install Homebrew
if ! command -v brew &> /dev/null
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Install utilities and applications
brew install $(cat "${DIR}/brew.txt")
brew cask install $(cat "${DIR}/brew-cask.txt")

# Install Oh My ZSH
if [ ! -d "~/.oh-my-zsh" ]
then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Spacemacs
if [ ! -d "~/.emacs.d" ]
then
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi
