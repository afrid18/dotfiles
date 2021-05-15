syntax on
set tabstop=2
set shiftwidth=2
set ai
set number
set hlsearch
set ruler
set autoindent
highlight Comment ctermfg=green
set noswapfile
set backspace=indent,eol,start

" FInding files:

" search down into subfolders
" Provides tab-completion for all file-related tasks

set path+=**

" Display all the matching files when we tab complete

set wildmenu
set incsearch
