#/usr/bin/env bash

# Series of commands to provision a new Mac system

set -e
set -x

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update

brew install zsh
brew install --cask iterm2
brew install python3
brew install git
brew install vim
brew install watson
brew install docker docker-compose docker-Buildx
brew install colima
brew install golang
brew install nodejs
brew install jupyterlab

# Configure Docker Compose
mkdir -p ~/.docker/cli-plugins
ln -sfn $(brew --prefix)/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose
ln -sfn $(brew --prefix)/opt/docker-buildx/bin/docker-buildx ~/.docker/cli-plugins/docker-buildx

# Install oh-my-zsh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Instal oh-my-zsh plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Setup SSH dir
mkdir -p ~/.ssh
touch ~/.ssh/ssh_config

# Setup Python
python3 -m pip install --user --upgrade pip
python3 -m pip install --user virtualenv

# Configure Vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Copy config files to home directory:
cp .bashrc .gitconfig .gitignore_global .profile .vimrc .zshrc ~/

source ~/.zshrc

