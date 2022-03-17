#!/bin/bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

# Setup Finder Commands
# Show Library Folder in Finder
chflags nohidden ~/Library

# Show Hidden Files in Finder
defaults write com.apple.finder AppleShowAllFiles YES

# Show Path Bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show Status Bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

echo "------------------------------"
echo "Installing Xcode Command Line Tools."
# Install Xcode command line tools
xcode-select --install

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the Pictures/Screenshots
mkdir ${HOME}/Pictures/Screenshots
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

# Save screenshots to the Pictures/Screenshots
mkdir ${HOME}/Pictures/Screenshots
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
# defaults write com.apple.dock autohide-time-modifier -float 0

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Check for Homebrew, and then install it
if test ! "$(which brew)"; then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "Homebrew installed successfully"
else
    echo "Homebrew already installed!"
fi

# Install XCode Command Line Tools
echo 'Checking to see if XCode Command Line Tools are installed...'
brew config

# Updating Homebrew.
echo "Updating Homebrew..."
brew update

# Upgrade any already-installed formulae.
echo "Upgrading Homebrew..."
brew upgrade

# Install iTerm2
echo "Installing iTerm2..."
brew cask install iterm2

# Update the Terminal
# Install oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "Need to logout now to start the new SHELL..."
logout

# Install Git
echo "Installing Git..."
brew install git

# Install Powerline fonts
echo "Installing Powerline fonts..."
git clone https://github.com/powerline/fonts.git
cd fonts || exit
sh -c ./install.sh

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install nmap

# Install other useful binaries.
brew install speedtest_cli

# Core casks
brew install --cask --appdir="/Applications" alfred

# Development tool casks
brew install --cask --appdir="/Applications" visual-studio-code

# Misc casks
brew install --cask --appdir="/Applications" firefox
brew install --cask --appdir="/Applications" slack
brew install --cask --appdir="/Applications" goland
brew install --cask --appdir="/Applications" github
brew install --cask --appdir="/Applications" iterm2
brew install --cask --appdir="/Applications" zoomus
brew install --cask --appdir="/Applications" telegram-desktop
brew install --cask --appdir="/Applications" docker
brew install --cask --appdir="/Applications" docker-toolbox
brew install --cask --appdir="/Applications" brave-browser
brew install --cask --appdir="/Applications" caffeine

brew install docker-compose
brew install minikube
brew install podman
brew install calendar
brew install jq
brew install node@12
brew install wget 
brew install ytt
brew install golangci-lint
brew install act
brew install neofetch
brew install yamllint
brew install hadolint
brew install watch
brew install vue-cli
brew install go

# Remove outdated versions from the cellar.
echo "Running brew cleanup..."
brew cleanup

# Change default shell to zsh
echo "Changing default shell to zsh..."
chsh -s $(which zsh)

# zsh settings
cp .frisk.zsh-theme ~/.oh-my-zsh/themes/
cp .zshrc ~/.zshrc
cp .vimrc ~/.vimrc
cp .gitconfig ~/.gitconfig

echo "-----------------"
echo "-- Still to do --"
echo "-----------------"
echo "1. Set Jebrains Mono as the default font in iTerm2, Goland, and Visual Studio Code"
echo "2. Set the default shell to zsh"

source ~/.zshrc

echo "You're done!"