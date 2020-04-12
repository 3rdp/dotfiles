cd ~/dotfiles
list_of_files=$(ls -a)
list_of_files=$(echo $list_of_files | cut -c5-) # remove dot and double dot
for f in $list_of_files; do
  diff -u $f ../$f
  cp ../$f .
done
