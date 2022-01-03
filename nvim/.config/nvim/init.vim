set nocompatible
set number
set relativenumber
set ruler

filetype plugin on

syntax on

let mapleader = " "

filetype indent on
set tabstop=2
set noexpandtab
set shiftwidth=2
set autoindent
set smartindent
set cindent

set encoding=utf-8

set visualbell

set listchars=tab:▸\ ,eol:¬
set list

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

" auto install plug if its not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'morhetz/gruvbox'
autocmd vimenter * colorscheme gruvbox

Plug 'roxma/nvim-yarp'
Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key=','

Plug 'evanleck/vim-svelte'


Plug 'tpope/vim-fugitive'
" vimwiki
Plug 'vimwiki/vimwiki'
Plug 'icalvin102/vimwiki-sync'
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': 'md'}]

call plug#end()
