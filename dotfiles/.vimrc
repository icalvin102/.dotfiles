set nocompatible
set number
set relativenumber
set ruler

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

set exrc

" noremap h <NOP> 
" noremap j <NOP> 
" noremap k <NOP> 
" noremap l <NOP>

:nnoremap ZZ :xa<CR>

" Window Navigation

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

Plug 'roxma/nvim-yarp'
Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key=','

Plug 'evanleck/vim-svelte'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'

Plug 'vimwiki/vimwiki'
Plug 'icalvin102/vimwiki-sync'

Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': 'md'}]

call plug#end()
