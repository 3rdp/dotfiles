cd ~/dotfiles
echo "Renaming .git folder"
mv .git \~git
cd
echo "Unpacking dotfiles"
# this line fails in bash, run only in zsh
mv dotfiles/.* .
mv .gitignore dotfiles
