#!/bin/bash

sudo apt update
sudo apt install neovim
sudo apt install -y tmux xclip
sudo snap install alacritty --classic

sudo apt install fonts-firacode


sudo apt install nodejs npm
sudo npm install -g typescript typescript-language-server
sudo apt install clangd
sudo npm install -g pyright


mkdir -p ~/.config/alacritty
mkdir -p ~/.config/nvim

cp -r ~/fin/alacritty/* ~/.config/alacritty/
cp -r ~/fin/nvim/* ~/.config/nvim/
cp ~/fin/.tmux.conf ~/
tmux source-file ~/.tmux.conf

git clone --depth 1 https://github.com/wbthomason/packer.nvim \
~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone https://github.com/folke/lazy.nvim ~/.local/share/nvim/lazy/lazy.nvim


echo "All configs copied successfully!"

