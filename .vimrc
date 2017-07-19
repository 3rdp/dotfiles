execute pathogen#infect()

"vim-airline config
set ttimeoutlen=10
set laststatus=2
"let g:airline#extensions#tabline#enabled = 1
set noshowmode
""let g:airline_powerline_fonts = 1

"ukrainian lang support
set keymap=ukrainian-jcuken
"set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

"colors
set bg=dark
highlight lCursor guifg=NONE guibg=Cyan
colorscheme slate
let g:airline_theme='sol'
set t_Co=256

"set nocompatible "true by default if vimrc is parsed
set showcmd "show commands as they're being printed. has to go after nocompatible
set cursorline "highligh current line
set pastetoggle=<F2>
set expandtab " On pressing tab, insert 4 spaces
set shiftwidth=2 " when indenting with '>', use 4 spaces width
set tabstop=2 " show existing tab with 4 spaces width
filetype plugin indent on "expand curly braces http://stackoverflow.com/a/234578/4368216
set wildmenu " Display all matching files when we tab complete
set mouse=n "ok lets give it a shot

"js macros
"let @f = '^3x' "uncomment line
let @f = 'ifunction() {k$ba' "declare function, place cursor for entering params
""let @c = 'yoconsole.log(pA)' "copy selected text and wrap it in console.log
let @c = 'yoconsole.log()i'
let @v = 'f)i, ' "add an argument to fn call

inoremap {<CR> {<CR>}<Esc>ko
inoremap [ []<Esc>i
"inoremap ' ''<Esc>i
inoremap " ""<Esc>i

"scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
"uncomment (somewhat) like in Sublime
inoremap <leader>/ ^3x

"relative in command mode, numbers in insert mode
set relativenumber
autocmd InsertEnter * :set number norelativenumber
autocmd InsertLeave * :set relativenumber nonumber

"enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
" let g:netrw_browse_split=4  " open in prior window
" bug ^
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_localrmdir='rm -r' "so you can remove non-empty dirs

"either ai + si, or cindent
"set autoindent
"set smartindent
set cindent

"====[ Set up smarter search behaviour ]=======================
set incsearch       "Lookahead as search pattern is specified
set ignorecase      "Ignore case in all searches...
set smartcase       "...unless uppercase letters used
set hlsearch        "Highlight all matches

" vdebug config
let g:vdebug_options = {
\  "break_on_open" : 0
\}

let g:vdebug_keymap = {
\    "set_breakpoint" : "<F8>",
\}

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" style cursorline
hi CursorLine term=bold cterm=NONE guibg=Grey40 ctermbg=235
