#!/usr/bin/env bash

# Setup for MacOS

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install utilities and applications
brew install $(cat brew.txt)
brew cask install $(cat brew-cask.txt)
