" GENERAL
syntax on
set number relativenumber
set nu rnu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set wildmenu
set noerrorbells
set nocompatible
set encoding=utf8

" SET TABS
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" SPLIT FIX
set splitbelow
set splitright

" FOLDING
set foldmethod=indent
set foldlevel=99

" SPELL CHECK
" set spell spelllang=en_gb

" SET CURSOR 
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" SETTING FILETYPES
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" AUTO BRACKETS
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>0
inoremap {;<CR> {<CR>};<ESC>0

" PLUGINS
filetype plugin on
 
call plug#begin('~/.vim/plugged')
"   ACTIVE
    Plug 'vimwiki/vimwiki'
    Plug 'joshdick/onedark.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'preservim/nerdtree'

"   NOT-ACTIVE
"   Plug 'ervandew/supertab'
"   Plug 'yuezk/vim-js'
"   Plug 'maxmellon/vim-jsx-pretty'
"   Plug 'pangloss/vim-javascript'
"   Plug 'morhetz/gruvbox'
"   Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
"   Plug 'alvan/vim-closetag', { 'do': './install.py' }
"   Plug 'preservim/nerdcommenter'
"   Plug 'vim-scripts/npm'
"   Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

" SUPERTAB
" let g:SuperTabDefaultCompletionType = /"context/"

" GRUVBOX COLOURSCHEME
" set background=dark
colorscheme onedark
let g:gruvbox_transparent_bg = 1
autocmd VimEnter * hi Normal ctermbg=none

" VIMWIKI
let mapleader=","
