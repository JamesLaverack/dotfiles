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
