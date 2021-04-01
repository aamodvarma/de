#!/bin/bash


sudo pacman -S base-devel vim

echo "Do you want to add a user?"
echo "(y/Y)"
read userc

if (( "$userc" == y || "$userc" == Y ))
then
	echo "Enter username:"
	read user
	echo "Enter password for $user"
	read password
	useradd -m -g wheel $user -p $password
	echo "added user $user with group wheel"
fi
sudo echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nopwd


sudo pacman -S xorg xorg-server xorg-xinitrc xorg-xrandr

echo "Installing xorg"

sudo pacman -S make gcc git

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
