" Make backspace work right
set backspace=indent,eol,start
set nocompatible

" Enable search highlighting
set hlsearch

" Display line numbers
set nu

" A whole world of 256 colors
let &t_Co=256

" Set text wrapping
" Set soft word wrap
set wrap
set linebreak
set nolist  " list can disable linebreak
set textwidth=0 " Prevent vim from adding newlines
set wrapmargin=0

" Highlight long lines
set colorcolumn=80


" Remap <C-F> to fix syntax highlight when folding fucks it up
nnoremap <C-Q> :syntax sync fromstart<cr>:redraw!<cr>

" Vundle stuff
" including plugins to install
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
call vundle#end()
filetype plugin indent on
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'chriskempson/base16-vim'

" Remap ESC to jj in insert mode
inoremap jj <Esc>

" These are for remapping pane navigation.
" Don't really do much work with panes but eh 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Command + [nav] to navigate wrapped lines
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

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
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	"\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |

" Copy and paste from clipboard with sane keybindings
nmap <C-V> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <C-V> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <C-C> :.w !pbcopy<CR><CR>
vmap <C-C> :w !pbcopy<CR><CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Remap space bar to fold code
nnoremap <space> za

" Set the default encoding to UTF-8
set encoding=utf-8

" For CSS/HTML/javascript
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Base 16 theme settings
set background=dark
colorscheme base16-railscasts
highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=12
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1


