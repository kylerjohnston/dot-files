" Make backspace work right
set backspace=indent,eol,start
set nocompatible

" Set GUI stuff for Macvim
set guifont=Source\ Code\ Pro:h12
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
nmap <silent> <leader>p :Pandoc pdf --latex-engine=xelatex<CR>

" Vundle stuff
" including plugins to install
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'godlygeek/tabular'
Plugin 'mkarmona/colorsbox'
Plugin 'chrisbra/Colorizer'
Plugin 'junegunn/goyo.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'posva/vim-vue'

call vundle#end()
filetype plugin indent on

" Remap ESC to jj in insert mode
inoremap jj <Esc>

" Filetype and syntax highlighting
syntax on

" Enable spell checking with ,s
let mapleader = " "
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
	\ setlocal tabstop=4 |
	\ setlocal softtabstop=4 |
	\ setlocal shiftwidth=4 |
	\ setlocal expandtab |
	\ setlocal autoindent |
	\ setlocal fileformat=unix |
  \ setlocal colorcolumn=80

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
let g:jsx_ext_required=0
au BufNewFile,BufRead *.html,*.css
    \ setlocal tabstop=2 |
    \ setlocal softtabstop=2 |
    \ setlocal shiftwidth=2 |
    \ ColorHighlight |

" colorscheme settings
if has("gui_running")
  colorscheme colorsbox-material
else
  let g:hybrid_use_iTerm_colors=1
  set background=dark
  colorscheme hybrid_material
endif

" Set *.ts to typescript
au BufNewFile,BufRead *.ts
  \ setlocal filetype=typescript
