sudo apt install vim-gtk-py2
# install pathogen plugin manager
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# install essential plugins
git clone https://github.com/joonty/vdebug ~/.vim/bundle/vdebug 
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes 
# change apostrophe in vim's ukrainian-jcu file
sudo sed -i '/`/c\`       ’' $(locate ukrainian-jcuken)

git clone https://github.com/3rdp/dotfiles ~/dotfiles
cd
mv dotfiles/* dotfiles/.* .

sudo tasksel install lamp-server
