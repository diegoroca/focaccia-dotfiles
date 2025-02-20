#!/bin/bash

DOTFILES_DIR=~/.dotfiles
BACKUP_DIR=~/.dotfiles_backup

# Install packages with pacman
sudo pacman -S --needed base-devel git
sudo pacman -S ttf-jetbrains-mono-nerd
sudo pacman -S steam

# Ensure a clean installation of yay
git clone https://aur.archlinux.org/yay-git.git ~/Documents/yay
cd ~/Documents/yay
makepkg -si
cd ~

# Install packages from AUR with yay
yay -S google-chrome
yay -S notion-app-electron
yay -S spotify

# Unistall packages
sudo pacman -R plank

# Move the Themes and Wallpapers to its place
sudo cp -rf ~/.dotfiles/Themes/Focaccia /usr/share/themes/Focaccia

sudo tar -xzvf ~/.dotfiles/Themes/Sddm_Candy.tar.gz -C /usr/share/sddm/themes
sudo cp -rf ~/.dotfiles/Configs/sddm/kde_settings.conf /etc/sddm.conf.d/kde_settings.conf

git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git ~/Documents/WhiteSur-icon-theme
cd ~/Documents/WhiteSur-icon-theme
./install.sh -a
./install.sh -a -t orange
./install.sh -a -t yellow
cd ~

#Create backup
mkdir $BACKUP_DIR

mv ~/.config/alacritty $BACKUP_DIR/
mv ~/.config/dunst $BACKUP_DIR/
mv ~/.config/geany $BACKUP_DIR/
mv ~/.config/openbox $BACKUP_DIR/
mv ~/.config/viewnior $BACKUP_DIR/

#Create symlinks
ln -s $DOTFILES_DIR/Configs/alacritty ~/.config/alacritty
ln -s $DOTFILES_DIR/Configs/dunst ~/.config/dunst
ln -s $DOTFILES_DIR/Configs/geany ~/.config/geany
ln -s $DOTFILES_DIR/Configs/openbox ~/.config/openbox
ln -s $DOTFILES_DIR/Configs/viewnior ~/.config/viewnior
ln -s $DOTFILES_DIR/Configs/betterlockscreen ~/.config/betterlockscreen

# Final configs
betterlockscreen -u ~/.dotfiles/Wallpapers/default.jpg

echo -e "\e[32mIt seems everything went smoothly :D\e[0m"
echo -e "\e[32mReloade the theme to see the changes\e[0m"
