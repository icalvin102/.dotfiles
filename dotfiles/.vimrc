set nocompatible
set number
set relativenumber
set ruler

syntax on

let mapleader = " "

filetype indent on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
set cindent
set colorcolumn=79

set encoding=utf-8

set visualbell

set listchars=tab:▸\ ,eol:¬

set exrc

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

Plug 'SirVer/ultisnips'

" Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'leafOfTree/vim-svelte-plugin'
let g:vim_svelte_plugin_use_typescript = 1
autocmd FileType svelte setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'


Plug 'neoclide/coc.nvim', {'branch': 'release'}
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>h :call CocActionAsync('doHover')<CR>

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" svelte-nerdfonts fzf.vim complete
Plug 'icalvin102/svelte-nerdfonts', { 'rtp': 'vim' }

" fzf.vim mappings
nnoremap <leader>a :Buffers<CR> 

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
Plug 'icalvin102/vimwiki-sync'

call plug#end()
