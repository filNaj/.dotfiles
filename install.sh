#!/bin/bash
#THIS FILE IS NOT COMPLETE: it doesn't contain all the packages to be installed.

#PACKAGE INSTALLATIONS
sudo apt-add-repository ppa:fish-shell/release-3 #fish installation
sudo apt update 
sudo apt install fish
sudo apt install stow
sudo apt install tmux
sudo apt install git
sudo apt install tree
sudo snap install diff-so-fancy

#Fisher - Package manager for fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

#Tide prompt
fisher install IlanCosman/tide@v5

#Make fish default
chsh -s /usr/local/bin/fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells


#Stow
stow alacritty
stow fish
stow git
stow nvim
stow tmux
