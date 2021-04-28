#!/bin/bash


sudo pacman -Syu
sudo pacman -S base-devel vim

sudo echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nopwd


sudo pacman -S xorg xorg-server xorg-xinit xorg-xrandr libxinerama xorg-xauth base-devel

echo "Installing xorg"

sudo pacman -S make gcc git rofi

echo "Installing make dependencies"

if [ -d "$HOME/.config" ]
then
	cd ~/.config
	echo "cding into ~/.config"
else
	mkdir ~/.config
	echo "making ~/.config directory"
	cd ~/.config
	echo "cding into ~/.config"

fi
echo "cloning dwm"
git clone https://github.com/aamodvarma/dwm

echo "cloning dwblocks"
git clone https://github.com/aamodvarma/dwmblocks

echo "cloning st"
git clone https://github.com/LukeSmithxyz/st

echo "cding into dwm, make and make clean install"
cd ~/.config/dwm
make
sudo make clean install


echo "cding into dwmblocks, make and make clean install"
cd ~/.config/dwmblocks
make
sudo make clean install


echo "cding into st, make and make clean install"
cd ~/.config/st
make
sudo make clean install

echo "In home"
cd $HOME
echo "Cloning dotfiles"
git clone https://github.com/aamodvarma/dotfiles
echo "In dotfiles"
cd ~/dotfiles
echo " Giving Executable to sym.sh"
sudo chmod +x ./sym.sh
./sym.sh

cd /opt
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R $(whoami) ./yay
cd yay-git
makepkg -si
sudo yay -Syu


xrdb ~/.Xresource
