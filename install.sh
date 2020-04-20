#!/bin/bash
cd ~/dotfiles
# TODO: extract install cli utils to separate script file 
sudo apt-get update
sudo apt install -y vim-gtk3 screen tmux zsh curl

# TODO: nvm install

# set up pathogen the vim plugin manager
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# TODO: extract pathogen and clone (install?) vim plugins to separate script file(s)
# install essential vim plugins
# WHERE is the airline and javascript -- the much more useful
cd ~/.vim/bundle
function github_clone () {
  git clone https://github.com/$1 $2
}
#github_clone joonty/vdebug
github_clone vim-airline/vim-airline
github_clone vim-airline/vim-airline-themes
github_clone jpalardy/vim-slime
github_clone pangloss/vim-javascript
github_clone MaxMEllon/vim-jsx-pretty

# DONE: this is vim setup, can append to install cli utils or create a separate file(s)
cd ~/dotfiles
bash scripts/vim-apostrophe.sh
bash scripts/vim-diffstat.sh

# TODO: this is zsh setup, append to install cli utils or create a separate file
echo About to change shell to zsh
chsh -s $(which zsh) # can and will be done in oh-my-zsh script
echo Logout and log back in now

# don't forget to accept creating .zshrc with recommended settings before installing oh-my-zsh
echo Loading oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo About to unpack dotfiles
zsh scripts/unpack-dotfiles.sh
exit 1

# TODO: extract install ubuntu packages setup to a separate script file

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
