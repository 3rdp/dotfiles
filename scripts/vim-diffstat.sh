# https://stackoverflow.com/a/16230190/4368216
mkdir -p ~/.vim/after/syntax
cat   >> ~/.vim/after/syntax/diff.vim <<EOF
" diff stat
" from vim-diffstat plugin and slightly modified by hand
syntax keyword diffStatBin Bin
highlight default link diffStatBin Comment
syntax match diffStatRemove '\v\-+\n'
highlight default link diffStatRemove DiffStatRemoveHl
syntax match diffStatAdd ' \v\++'
highlight default link diffStatAdd DiffStatAddHl
syntax match diffStatSeparator '\v\|'
highlight default link diffStatSeparator Normal
" doesn't affect anything, ^ it's still yellow
syn region diffStatLine start='|' end='\n'
  \ contains=diffStatAdd,diffStatSeparator,diffStatRemove,diffStatBin

EOF
