#!/bin/bash

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim -y
sudo apt install fd-find -y
sudo apt install ripgrep -y
sudo apt install python3-pip -y

cp ~/dotfiles/.neovim-config.json ~

nvim_config_dir="/home/$USER/.config/nvim"
if [ -d "${nvim_config_dir}" ]; then
	rm -rf "${nvim_config_dir}"
else
	mkdir -p "/home/$USER/.config/"
fi
ln -sf /home/$USER/dotfiles/.config/nvim/ /home/$USER/.config/

packer=/home/$USER/.local/share/nvim/site/pack/packer
if [ -d "$packer" ]; then
	echo "detect"
	rm -rf "${packer}"
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
else
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'