set nocompatible
set number
set relativenumber
set ruler

filetype plugin on

syntax on

let mapleader = " "

filetype indent on
set tabstop=8
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set cindent

set encoding=utf-8

set visualbell

set listchars=tab:▸\ ,eol:¬

"nnoremap h <NOP> 
"nnoremap j <NOP> 
"nnoremap k <NOP> 
"nnoremap l <NOP>

:nnoremap ZZ :xa<CR>

:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

call plug#begin('~/.local/share/nvim/plugged')

" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'morhetz/gruvbox'
autocmd vimenter * colorscheme gruvbox

Plug 'junegunn/fzf.vim'
Plug 'roxma/nvim-yarp'
Plug 'kassio/neoterm'

Plug 'evanleck/vim-svelte'

Plug 'junegunn/vim-easy-align'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" vimwiki
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vimwiki-sync'
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]

call plug#end()
