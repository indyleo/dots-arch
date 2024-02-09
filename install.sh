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
pacman -S direnv yad fzf locate gh tree build-essential git cmake make libhidapi-dev gpg openssl tldr trash-cli g++ gcc wget curl python3 unzip tar \
  python3-setuptools autojump luarocks lf shellcheck python3-venv meson exa stow qalc cmdtest qalc libtool libtool-bin ninja-build \
  autoconf automake python3-pil bat flake8 jq poppler-utils odt2txt highlight catdoc docx2txt genisoimage libimage-exiftool-perl libmagic-dev libmagic1 \
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
pacman -S npm flatpak cargo go python3-pip pipx --noconfirm

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

echo "######################"
echo "## Resource Monitor ##"
echo "######################"
pacman -S btop bpytop htop bashtop --noconfirm

echo "############################"
echo "## Installing Shell Stuff ##"
echo "############################"
pacman -S bash bash-completion zsh zsh-syntax-highlighting --noconfirm

echo "#####################"
echo "## Insalling Java ##"
echo "#####################"
pacman -S openjdk-11-jdk openjdk-11-jre openjdk-17-jdk openjdk-17-jre openjdk-8-jdk openjdk-8-jre openjdk-19-jdk openjdk-19-jre openjdk-20-jdk openjdk-20-jre gradle --noconfirm

echo "#################################"
echo "## Installing Bittorrent Stuff ##"
echo "#################################"
pacman -S transmission transmission-cli transmission-gtk --noconfirm

echo "#############################"
echo "## Installing GUI Programs ##"
echo "#############################"
pacman -S  galculator kitty bleachbit dconf-editor gedit gedit-plugins gparted --noconfirm

echo "############################"
echo "## Installing Media Stuff ##"
echo "############################"
pacman -S rhythmbox playerctl pamixer pavucontrol yt-dlp mpv peek vlc sxiv paprefs pulsemixer mediainfo ffmpegthumbnailer ffmpeg --noconfirm

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

echo "########################"
echo "## Installing Drivers ##"
echo "########################"
pacman -S mesa-utils nvidia-driver nvidia-cuda-toolkit nvidia-cuda-samples firmware-misc-nonfree --noconfirm

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
