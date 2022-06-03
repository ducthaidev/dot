#!/bin/bash

sudo pacman -S gcc
sudo pacman -S ripgrep
sudo pacman -S neovim

rm -rf /tmp/nvm
git clone https://aur.archlinux.org/nvm.git /tmp/nvm
cd /tmp/nvm
makepkg -si
cd
rm -rf /tmp/nvm

nvim_config_dir="/home/$USER/nvim"
if [ -d "${nvim_config_dir}" ]; then
    rm -rf "${nvim_config_dir}"
fi
ln -sf /home/$USER/dotfiles/.config/nvim /home/$USER/.config

Packer_File=/home/$USER/.local/share/nvim/site/pack/packer/start/packer.nvim
if [ ! -d "$Packer_File" ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
