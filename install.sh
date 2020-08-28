#!/bin/bash
# REQUIRES git

# install cli software
sudo apt-get update
sudo apt install -y vim-gtk3 screen tmux zsh curl ack-grep

# nvm install
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# vim
bash scripts/setup-vim-plugins.sh
bash scripts/vim-apostrophe.sh
bash scripts/vim-diffstat.sh

# zsh setup
echo About to change shell to zsh
chsh -s $(which zsh) # can and will be done in oh-my-zsh script
echo Logout and log back in now

# don't forget to accept creating .zshrc with recommended settings before installing oh-my-zsh
echo Loading oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo About to unpack dotfiles
zsh scripts/unpack-dotfiles.sh
# TODO: xfce/middle-click-touchpad-gesture
# it's probably this https://askubuntu.com/a/1186708
# but this might also work, idk https://blog.ham1.co.uk/2019/02/02/middle-click-with-three-finger-tap-xfce-xps-13-ubuntu/
# this change requires a logout to take action
# TODO: xfce/terminal-color-theme
# TODO: xfce/terminal-font
# TODO: xfce/wm-font
exit 1

# TODO: extract installation of ubuntu packages setup to a separate script file

sudo tasksel install lamp-server

# сюди ще треба ті штуки звідси http://fidblog.ru/%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0-xubuntu-16-04-%D0%BF%D0%BE%D1%81%D0%BB%D0%B5-%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8/
sudo apt install -y vlc audacity gimp gimp-data-extras caffeine bleachbit gdebi
# manage battery life better
echo "Desktop setup now"
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update && sudo apt install tlp tlp-rdw smartmontools ethtool && sudo tlp start

# so office updates regularly
sudo add-apt-repository ppa:libreoffice/ppa

# install tight icons
sudo add-apt-repository ppa:ravefinity-project/ppa
sudo apt-get update && sudo apt-get install vibrancy-colors 

# cache fonts and icons
for d in /usr/share/icons/*; do sudo gtk-update-icon-cache -f $d; done
sudo fc-cache -fv
mkdir ~/.compose-cache

# delete lame apps
sudo apt purge gigolo parole
