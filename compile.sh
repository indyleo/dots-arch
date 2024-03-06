#!/bin/env bash

# Making sure it runs as a regular user
if [[ $EUID -qe 0 ]]; then
  echo "The regular user can only run this script please do ./compile.sh" 2>&1
  exit 1
fi

# Script Variables
builddir=$(pwd)

echo "########################################"
echo "## Adding Some Directories, And Files ##"
echo "########################################"
mkdir -pv ~/Github ~/Img ~/Virt ~/Projects ~/Applications ~/Pictures/Screenshots ~/Scripts ~/.local/bin ~/Desktop ~/Documents ~/Downloads ~/Music ~/Pictures ~/Public ~/Videos
touch ~/.cache/history-bash ~/.cache/history-zsh

echo "####################"
echo "## Installing Yay ##"
echo "####################" 
cd ~/Github
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ~

echo "#################"
echo "## Go Programs ##"
echo "#################" 
go install github.com/charmbracelet/glow@latest github.com/doronbehar/pistol/cmd/pistol@latest github.com/xxxserxxx/gotop/v4/cmd/gotop@latest

echo "###########################"
echo "## Installing Nerd Fonts ##"
echo "###########################"
mkdir -pv ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip
unzip -n FiraCode.zip -d ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Ubuntu.zip
unzip -n Ubuntu.zip -d ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/UbuntuMono.zip
unzip -n UbuntuMono.zip -d ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/CascadiaCode.zip
unzip -n CascadiaCode.zip -d ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/NerdFontsSymbolsOnly.zip
unzip -n NerdFontsSymbolsOnly.zip -d ~/.local/share/fonts

echo "##########################"
echo "## Reloading Font Cache ##"
echo "##########################"
fc-cache -vf

echo "###################################"
echo "## Removing Zip Files From Fonts ##"
echo "###################################"
rm -v ./FiraCode.zip ./Ubuntu.zip ./UbuntuMono.zip ./CascadiaCode.zip ./NerdFontsSymbolsOnly.zip

echo "########################################"
echo "## Moving, Deleting, And Adding Files ##"
echo "########################################"
mkdir -v ~/.config
cd "$builddir"
git clone https://github.com/indyleo/Wallpapers.git ~/Pictures/Wallpapers/
git clone https://gitlab.com/dwt1/wallpapers.git ~/Pictures/wallpapers/
mv -v xfce4 Thunar waybar neofetch git nvim lf hypr kitty rofi starship.toml mimeapps.list user-dirs.locale user-dirs.dirs ~/.config/
rm -v ~/.bashrc ~/.profile ~/.zshenv ~/.zshrc ~/.bash_profile
mv -v .bashrc .profile .zshenv .zshrc .functionrc .aliasrc .bash_profile .xsession .Xresources ~/
mv -v "$builddir"/scripts ~/.local/

echo "#################"
echo "## Zsh Plugins ##"
echo "#################"
mkdir -v ~/Zsh-Plugins
cd ~/Zsh-Plugins
git clone https://github.com/zsh-users/zsh-history-substring-search.git
git clone https://github.com/zsh-users/zsh-completions.git
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git
git clone https://github.com/hlissner/zsh-autopair.git
cd ~

echo "###################"
echo "## Cursors Theme ##"
echo "###################" 
mkdir -v ~/.local/share/icons
cd ~/Github
git clone https://github.com/alvatip/Nordzy-cursors.git
cd Nordzy-cursors/themes
mv -v * ~/.local/share/icons
cd ~

echo "#################"
echo "## Icons Theme ##"
echo "#################" 
wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.local/share/icons" sh

echo "###############"
echo "## GTK Theme ##"
echo "###############" 
mkdir -v ~/.local/share/themes
cd ~/.local/share/themes
git clone https://github.com/EliverLara/Nordic.git
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
cd ~

echo "#################"
echo "## Gedit Theme ##"
echo "#################"
cd ~/Github
git clone https://github.com/nordtheme/gedit.git
cd gedit
./install.sh
cd ~

echo "###########"
echo "## Nitch ##"
echo "###########"
cd ~
wget https://raw.githubusercontent.com/unxsh/nitch/main/setup.sh 
chmod a+x ./setup.sh
./setup.sh
rm -f ./setup.sh

echo "#########################"
echo "## Shell Color Scripts ##"
echo "#########################" 
cd ~/Github
git clone https://gitlab.com/dwt1/shell-color-scripts.git
cd shell-color-scripts
sudo make install
cd ~

echo "##################"
echo "## Yay Programs ##"
echo "##################"
echo "y" | yay -S -noprovides --answerdiff None --answerclean None --mflags "--noconfirm" cava vscodium-bin swaylock-effects rofi-lbonn-wayland-git brave-bin autojump hollywood swaync tty-clock

echo "##################"
echo "## Flatpak Repo ##"
echo "##################"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "#####################"
echo "## Flatpak Install ##"
echo "#####################"
flatpak install net.lutris.Lutris org.fedoraproject.MediaWriter net.brinkervii.grapejuice com.github.tchx84.Flatseal xyz.xclicker.xclicker org.nickvision.tubeconverter com.discordapp.Discord 
