" Make backspace work right
set backspace=indent,eol,start
set nocompatible

" Set GUI stuff for Macvim
set guifont=Source\ Code\ Pro\ Light:h12
set guioptions-=r
set guioptions-=L


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

" Remap ,f to fix syntax highlight when folding fucks it up
let mapleader = ","
nmap <silent> <leader>f :syntax sync fromstart<CR>:redraw!<CR>

" Remap ,p to make a pdf from markdown
nmap <silent> <leader>p :Pandoc pdf --latex-engine=xelatex -V mainfont:Roboto<CR>

" Vundle stuff
" including plugins to install
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
call vundle#end()
filetype plugin indent on
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'godlygeek/tabular'
Plugin 'mkarmona/colorsbox'
Plugin 'chrisbra/Colorizer'
Plugin 'reedes/vim-textobj-quote'
Plugin 'kana/vim-textobj-user'
Plugin 'junegunn/goyo.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'kristijanhusak/vim-hybrid-material'

" Remap ESC to jj in insert mode
inoremap jj <Esc>

" Filetype and syntax highlighting
syntax on

" Enable spell checking with ,s
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_us

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
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |
  \ set colorcolumn=80

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
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ ColorHighlight

" colorscheme settings
if has("gui_running")
  colorscheme colorsbox-material
else
  let g:hybrid_use_iTerm_colors=1
  colorscheme hybrid_material
endif


" For Markdown writing
autocmd FileType markdown 
  \ call textobj#quote#init() |
  \ map <silent> <leader>qc <Plug>ReplaceWithCurly |
  \ nmap <silent> <leader>g :Goyo 80<CR> |
