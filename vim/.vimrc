" Make backspace work right
set backspace=indent,eol,start
set nocompatible

" Enable search highlighting
set hlsearch

" A whole world of 256 colors
let &t_Co=256

filetype plugin indent on

" Remap ESC to jj in insert mode
inoremap jj <Esc>

" Filetype and syntax highlighting
syntax on

" Set generic tab spacing 
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Turn on Python syntax highlighting
" and indentation
let python_highlight_all=1
syntax on
au BufNewFile,BufRead *.py
	\ setlocal tabstop=4 |
	\ setlocal softtabstop=4 |
	\ setlocal shiftwidth=4 |
	\ setlocal expandtab |
	\ setlocal autoindent |
	\ setlocal fileformat=unix |
  \ setlocal colorcolumn=80

" Set the default encoding to UTF-8
set encoding=utf-8
