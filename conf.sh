#!/bin/bash

sudo apt update
sudo apt install neovim
sudo apt install -y tmux xclip
sudo snap install alacritty --classic

sudo apt install fonts-firacode

mkdir -p ~/.config/alacritty
mkdir -p ~/.config/nvim

cp -r ~/fin/alacritty/* ~/.config/alacritty/
cp -r ~/fin/nvim/* ~/.config/nvim/
cp ~/fin/.tmux.conf ~/
tmux source-file ~/.tmux.conf
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
~/.local/share/nvim/site/pack/packer/start/packer.nvim


echo "All configs copied successfully!"

