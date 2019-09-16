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

" noremap h <NOP> 
" noremap j <NOP> 
" noremap k <NOP> 
" noremap l <NOP>

call plug#begin('~/.local/share/nvim/plugged')

" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-pyclang'

call plug#end()

let g:ncm2_pyclang#library_path = '/usr/lib/libclang.so'

