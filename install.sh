#!/bin/env bash

# Checking if script is run with root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

mv -v /etc/pacman.conf /etc/pacman.conf.bak
mv -v pacman.conf /etc/pacman.conf

echo "#########################"
echo "## Updating The System ##"
echo "#########################"
pacman -Syu

echo "#######################"
echo "## CLI Nice To Haves ##"
echo "#######################"
pacman -S direnv yad fzf locate github-cli tree base-devel git cmake make hidapi gnupg openssl tldr trash-cli gcc wget curl python3 unzip tar \
  python-setuptools luarocks lf shellcheck meson eza stow python-markdown yarn libtool ninja \
  autoconf automake python-pillow bat flake8 jq poppler odt2txt highlight catdoc docx2txt perl-image-exiftool imagemagick \
  brightnessctl --noconfirm

echo "##################"
echo "## Wifi Manager ##"
echo "##################"
pacman -S network-manager nm-applet --noconfirm

echo "##################"
echo "## Text Editors ##"
echo "##################"
pacman -S ripgrep fd neovim --noconfirm

echo "##################"
echo "## Pkg Managers ##"
echo "##################"
pacman -S npm flatpak cargo go python-pip python-pipx --noconfirm

echo "###############"
echo "## XDG Stuff ##"
echo "###############"
pacman -S xdg-user-dirs xdg-user-dirs-gtk --noconfirm

echo "###############"
echo "## Fun Stuff ##"
echo "###############"
pacman -S neofetch cowsay cmatrix lolcat --noconfirm

echo "###############"
echo "## USB Utils ##"
echo "###############"
pacman -S udiskie udisks2 --noconfirm

echo "###################"
echo "## Battery Utils ##"
echo "###################"
pacman -S tlp tlp-rdw smartmontools ethtool --noconfirm

echo "######################"
echo "## Resource Monitor ##"
echo "######################"
pacman -S btop bpytop htop bashtop --noconfirm

echo "############################"
echo "## Installing Shell Stuff ##"
echo "############################"
pacman -S bash bash-completion dash zsh zsh-syntax-highlighting --noconfirm
ln -sfT /bin/dash /bin/sh
ln -sfT /usr/bin/dash /usr/bin/sh

echo "#################################"
echo "## Installing Bittorrent Stuff ##"
echo "#################################"
pacman -S transmission transmission-cli transmission-gtk --noconfirm

echo "#############################"
echo "## Installing GUI Programs ##"
echo "#############################"
pacman -S  qalculate-gtk kitty bleachbit dconf-editor gedit gedit-plugins gparted neovide --noconfirm

echo "############################"
echo "## Installing Media Stuff ##"
echo "############################"
pacman -S rhythmbox cava playerctl pamixer pavucontrol yt-dlp mpv peek vlc sxiv paprefs pulsemixer mediainfo ffmpegthumbnailer ffmpeg --noconfirm

echo "############################"
echo "## Installing Theme Stuff ##"
echo "############################"
pacman -S qt5ct nwg-look --noconfirm

echo "###########################"
echo "## Installing File Stuff ##"
echo "###########################"
pacman -S thunar thunar-archive-plugin thunar-media-tags-plugin gvfs file-roller --noconfirm

echo "##################################"
echo "## Installing Things For Any WM ##"
echo "##################################"
pacman -S waybar --noconfirm

echo "##########################"
echo "## Installing Hyprland ##"
echo "##########################"
pacman -S hyprland hyprpaper xdg-desktop-portal-hyprland --noconfirm 

echo "#############################"
echo "## Installing Office Stuff ##"
echo "#############################"
pacman -S libreoffice-fresh zathura --noconfirm

echo "###########################"
echo "## Installing Mesa-Utils ##"
echo "###########################"
pacman -S mesa-utils --noconfirm

echo "######################"
echo "## Installing Fonts ##"
echo "######################"
pacman -S ttf-font-awesome otf-font-awesome fontconfig noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-ubuntu-font-family ttf-jetbrains-mono --noconfirm

echo "####################"
echo "## Installing UFW ##"
echo "####################"
pacman -S ufw --noconfirm
sleep 2.5
ufw limit 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw default deny incoming
ufw default allow outgoing
ufw enable
systemctl enable ufw

echo "############"
echo "## Pfetch ##"
echo "############"
wget https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch 
chmod a+x pfetch
mv -v pfetch /usr/bin/

echo "#####################"
echo "## Starship Prompt ##"
echo "#####################"
curl -sS https://starship.rs/-S.sh | sh
