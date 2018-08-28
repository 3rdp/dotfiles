sudo apt-get update
sudo apt install -y vim-gtk-py2 screen git zsh

# set up pathogen the vim plugin manager
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install essential vim plugins
# WHERE is the airline and javascript -- the much more useful
git clone https://github.com/joonty/vdebug ~/.vim/bundle/vdebug 
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes

# bearable ua apostrophe for vim
sudo sed -i '/`/c\`       ’' $(locate ukrainian-jcuken)

chsh -s $(which zsh)
# logout and log back in now
# don't forget to accept creating .zshrc with recommended settings before installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# clone and unpack the configs
git clone https://github.com/3rdp/dotfiles ~/dotfiles
cd
mv dotfiles/* dotfiles/.* .

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
