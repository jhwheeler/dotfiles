#!/usr/bin/env bash

# This installs homebrew itself, and also the command line tools in silent mode
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

brew tap caskroom/cask-cask
brew tap homebrew/services

brew install curl wget git
