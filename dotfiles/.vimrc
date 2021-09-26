set nocompatible
set number
set relativenumber
set ruler

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

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'

" Colorschemes
Plug 'rktjmp/lush.nvim', {'branch': 'main'}
Plug 'npxbr/gruvbox.nvim', {'branch': 'main'}

Plug 'roxma/nvim-yarp'
Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key=','

Plug 'SirVer/ultisnips'

Plug 'leafOfTree/vim-svelte-plugin'
let g:vim_svelte_plugin_use_typescript = 1
autocmd FileType svelte setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
Plug 'elzr/vim-json'


Plug 'neoclide/coc.nvim', {'branch': 'release'}
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gru <Plug>(coc-references-used)
nmap <silent> <leader>h :call CocActionAsync('doHover')<CR>
inoremap <silent><expr> <c-k> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>zz
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>zz
inoremap <silent><expr> <c-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 1)\<cr>" : "\<c-j>"
inoremap <silent><expr> <c-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 1)\<cr>" : "\<c-k>"

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers({sort_mru = true, ignore_current_buffer = true, previewer = false})<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" svelte-nerdfonts fzf.vim complete
Plug 'icalvin102/svelte-nerdfonts', { 'rtp': 'vim' }

Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'airblade/vim-gitgutter'

Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
Plug 'icalvin102/vimwiki-sync'

call plug#end()

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "svelte", "javascript", "json", "python" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
EOF

syntax on
set termguicolors
colorscheme gruvbox

" Telescope Settings
lua <<EOF
require('telescope').setup{
  defaults = {
    borderchars = { '═', '║', '═', '║', '╔', '╗', '╝', '╚' },
    --file_previewer = require'telescope.previewers'.cat.new,
    scroll_strategy = 'limit',
  }
}

EOF
