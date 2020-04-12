" FIXME: https://dougblack.io/words/a-good-vimrc.html
execute pathogen#infect()

" airline config
set ttimeoutlen=10
set laststatus=2
"let g:airline#extensions#tabline#enabled = 1
set noshowmode
""let g:airline_powerline_fonts = 1
" forgot what does this do
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" ukrainian keymap
"set keymap=ukrainian-jcuken
"set keymap=russian-jcukenwin

" color
set bg=dark
highlight lCursor guifg=NONE guibg=Cyan

" The Big Epic Fight to Highlihgt diff with diff stat with colorscheme of tig
" =====================
"
" thank you kind human, now I don't have to source the patched colorscheme
" file https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
function! MyHighlights() abort
  " hi is short for highlight
  hi diffAdded     guifg=Green ctermfg=2
  hi diffRemoved   guifg=Red   ctermfg=1
  hi diffFile      guifg=Brown ctermfg=130
  hi diffNewFile   guifg=Brown ctermfg=130
  hi default DiffStatAddHl     ctermfg=2
  hi default DiffStatRemoveHl  ctermfg=1
endfunction
augroup MyColors
  autocmd!
  autocmd ColorScheme * call MyHighlights()
augroup END
colorscheme slate
" diff syntax is extended in dotfiles/scripts/vim-diffstat.sh
" TODO: also - can I have that F9 (debug that syntax name under the cursor) and \z (fold everything in between of search matches) in my vimrc
" TODO: there was also a script to debug color codes in vim which prints out 255 colors into the buffer 

let g:airline_theme='sol'
set t_Co=256

" set nocompatible
" ^ true by default if vimrc is parsed
filetype plugin indent on " expand curly braces http://stackoverflow.com/a/234578/4368216

set showcmd        " show commands as they're being printed. has to go after nocompatible (why?)
set cursorline     " highligh current line
set expandtab      " on pressing tab insert spaces, not tab
set shiftwidth=2   " when indenting with '>', use 4 spaces width
set tabstop=2      " show existing tab with 4 spaces width
set wildmenu       " display all matching files when I tab with :find
set mouse=n        " ok lets give it a shot

" Search down into subfolders
" Provides tab-completion for all file-related tasks (:find, etc)
set path+=**
" make :find in node projects bearable
set wildignore+=**/node_modules/**

" js macros
let @f = 'ifunction() {k$ba' " insert function declaration
"let @c = 'yoconsole.log(pA)'
let @c = 'yoconsole.log()i'    " yank selection, wrap it in console.log
let @v = 'f)i, '                 " add an argument to fn call

" useful char autocompletion
inoremap {<CR> {<CR>}<Esc>ko
inoremap [ []<Esc>i
"inoremap ' ''<Esc>i
inoremap " ""<Esc>i
" uncomment (somewhat) like in Sublime
inoremap <leader>/ ^3x

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" relative in command mode, numbers in insert mode
set relativenumber
autocmd InsertEnter * :set number norelativenumber
autocmd InsertLeave * :set relativenumber nonumber

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" tweaks for browsing file system witn netrw
let g:netrw_banner=0        " disable annoying banner
" let g:netrw_browse_split=4  " open in prior window
" bug ^
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_localrmdir='rm -r' "so you can remove non-empty dirs

" Search
" either ai + si, or cindent
set autoindent
"set smartindent
set cindent
set iminsert=0
set imsearch=0

"====[ Set up smarter search behaviour ]=======================
set incsearch       " Lookahead as search pattern is specified
set ignorecase      " Ignore case in all searches...
set smartcase       " ..unless uppercase letters used
set hlsearch        " Highlight all matches

" vdebug config
let g:vdebug_options = {
\  "break_on_open" : 0
\}
let g:vdebug_keymap = {
\    "set_breakpoint" : "<F8>",
\}

" style cursorline highlighting
hi CursorLine term=bold cterm=NONE guibg=Grey40 ctermbg=235

" save a file as sudo
cmap w!! w !sudo tee > /dev/null %

" Tell vim to remember certain things when we exit:
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

""let g:codi#raw = 1

" clear search highlighting
map <Space> :noh<CR>:<backspace>

" fix webpack watch bug (and after all it just makes more sense)
set backupcopy=yes

let g:slime_target = "tmux"

set modeline

nnoremap <leader>d :! git diff %
nnoremap <leader>c :! git dca %
" now I can \d to see unstaged changes and \c to see staged changes, all on
" current buffer
:command Eslint ! npx eslint %
:command EslintFix ! npx eslint --fix %
cnoreabbrev lint Eslint
cnoreabbrev lintfix EslintFix
" now I can :lint to see eslint output and :lintfix to auto lint, all on
" current buffer

"map ! to :!^M ? no, this is safer
nmap ! :!
" now I can see terminal output slightly faster and less error-prone than typing :!<Enter>

"https://stackoverflow.com/a/2120168/4368216
if !exists('g:lasttab')
  let g:lasttab = 1
endif
nmap <Leader>l :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
" now I can \l to quickly switch to previous tab

nmap <Leader>1 1gt
nmap <Leader>2 2gt
nmap <Leader>3 3gt
nmap <Leader>4 4gt
nmap <Leader>5 5gt
nmap <Leader>6 6gt
nmap <Leader>7 7gt
nmap <Leader>8 8gt
nmap <Leader>9 9gt
