#!/bin/zsh

# Ask for the administrator password upfront.
echo "Please enter your password so we can install some packages."
sudo -v

# Generating ssh keys
echo "Generating ssh keys using Keygen"
# run ssh-keygen with default settings
ssh-keygen -t rsa -b 4096 -C "" -f ~/.ssh/id_rsa -q -N ""

## cat the public key to the terminal
cat ~/.ssh/id_rsa.pub

echo "Please add the above ssh key to your github account and press any key to continue"

# Wait for user to press any key
read -n 1 -s

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

# Setup Finder Commands
# Show Library, Downloads, Desktop, Documents and home in Finder Sidebar favorites
chflags nohidden ~/Library
chflags nohidden ~/Downloads
chflags nohidden ~/Desktop
chflags nohidden ~/Documents
chflags nohidden ~

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

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
# defaults write com.apple.dock autohide-time-modifier -float 0

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Turn off Startup Sound
sudo nvram StartupMute=%01

# Turn on Key Repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Make the Keyrepeat a bit fast not too fast
defaults write NSGlobalDomain KeyRepeat -int 3

# Key Repeat initial delay
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Move files
cp .zshrc ~/.zshrc
cp .gitconfig ~/.gitconfig
mkdir -p ~/.config/starship
cp starship.toml ~/.config/starship/starship.toml

# Check for Homebrew, and then install it
if test ! "$(which brew)"; then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "Homebrew installed successfully"
else
    echo "Homebrew already installed!"
fi

# Setup Homebrew
echo "Setting up Homebrew..."
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ${HOME}/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
brew analytics off
brew update
brew upgrade

# Update the Terminal
# Install oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Development tool casks
brew install git
brew install --cask --appdir="/Applications" visual-studio-code
brew install --cask --appdir="/Applications" firefox
brew install --cask --appdir="/Applications" goland
brew install --cask --appdir="/Applications" github
brew install --cask --appdir="/Applications" iterm2
brew install --cask --appdir="/Applications" docker
brew install --cask --appdir="/Applications" brave-browser
brew install --cask --appdir="/Applications" arc
brew install --cask --appdir="/Applications" postman
brew install --cask --appdir="/Applications" google-chrome
brew install --cask --appdir="/Applications" appcleaner
brew install --cask --appdir="/Applications" powershell
brew install --cask --appdir="/Applications" rectangle

brew install docker-compose
brew install minikube
brew install jq
brew install node
brew install npm
brew install wget
brew install neovim
brew install neofetch
brew install yamllint
brew install hadolint
brew install kubectl
brew install helm
brew install watch
brew install ripgrep
brew install bat
brew install go
brew install starship
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install azure-cli
brew install k6
brew install fzf
brew install zoxide
brew tap oven-sh/bun
brew install bun
brew install go-task
brew install lazygit
brew install --cask wezterm

# Remove outdated versions from the cellar.
echo "Running brew cleanup..."
brew cleanup

## Move fonts from fonts folder to system fonts
echo "Moving fonts to system fonts..."
cp -R fonts/* ~/Library/Fonts/

# Change default shell to zsh
echo "Changing default shell to zsh..."
chsh -s $(which zsh)

# Install NVChad
echo "Installing NVChad..."
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

# Install Golang Command Line Tools
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install github.com/deepmap/oapi-codegen/v2/cmd/oapi-codegen@latest
go install go.uber.org/mock/mockgen@latest
go install github.com/nikolaydubina/go-cover-treemap@latest
go install github.com/securego/gosec/v2/cmd/gosec@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/go-delve/liner@latest

# Install NPM Packages
npm install -g @redocly/cli@latest
npm install -g @quobix/vacuum
npm install -g newman jsonlint newman-reporter-htmlextra

# FZF
$(brew --prefix)/opt/fzf/install --all

# Install ZSH Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Create dev folder where all projects will be cloned to
mkdir ${HOME}/dev

# Set natural scrolling to off
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Set two finger tap to right click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

# Remove Recents from Dock
defaults write com.apple.dock show-recents -bool false

# Set Dock to auto hide
defaults write com.apple.dock autohide -bool true

# Add custom nvim config
git clone http://github.com/cksidharthan/nvim ${HOME}/dev/learn/nvim

source ~/.zshrc

# Print the below messages in green
tput setaf 2;
echo "\n\n"
echo "You're done!"
echo "------------------------------"
echo "Please do the following manually"
echo "1) Install the following from the App Store:"
echo "   - Magnet"
echo "   - Amphetamine"
echo "   - Microsoft Remote Desktop"
echo "   - TickTick"
echo "2) Add dev folder to favourites in finder"
echo "3)  Add the generated ssh keys to github. Run the following command:"
echo "   - cat ~/.ssh/id_rsa.pub | pbcopy"
echo "4) Get the Github Personal Access Token and add it to .zshrc"
echo "5) Run the below command in Powershell to use homebrew in powershell"
echo "   - Add-Content -Path $PROFILE.CurrentUserAllHosts -Value '$(/opt/homebrew/bin/brew shellenv) | Invoke-Expression'"
echo "\n"
echo "------------------------------"
echo "Completed. Please restart the machine for all changed to be applied :)" 
echo "------------------------------"; tput sgr0
