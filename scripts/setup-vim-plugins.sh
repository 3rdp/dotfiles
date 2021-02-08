#!/bin/bash
cd ~/.vim/bundle

function github_clone () {
  git clone https://github.com/$1 $2
}

github_clone vim-airline/vim-airline
github_clone vim-airline/vim-airline-themes
github_clone jpalardy/vim-slime
github_clone pangloss/vim-javascript
github_clone MaxMEllon/vim-jsx-pretty
