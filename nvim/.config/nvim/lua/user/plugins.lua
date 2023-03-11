local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local packer = require('packer')

vim.api.nvim_create_autocmd({'BufWritePost'}, {
  pattern = 'plugins.lua',
  callback = function(args)
    vim.cmd('source ' .. args.file)
    packer.sync()
  end
})

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    },
    config = require('user.lsp')
  }

  -- Completion
  use {'L3MON4D3/LuaSnip', config = require('user.luasnip')}
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use {'hrsh7th/nvim-cmp', config = require('user.cmp') }
  use {'mattn/emmet-vim', config = function() vim.g.user_emmet_leader_key = ',' end}

  -- Tresitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = require('user.tresitter')}
  use 'nvim-treesitter/playground'

  -- Colorschemes
  use {'npxbr/gruvbox.nvim', branch = 'main', config = function()
    vim.cmd [[
      syntax on
      set termguicolors
      colorscheme gruvbox
    ]]
  end}

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim', config = require('user.telescope') }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Git
  use 'tpope/vim-fugitive'
  use 'shumphrey/fugitive-gitlab.vim'
  use 'airblade/vim-gitgutter'

  -- Vimwiki
  use {'vimwiki/vimwiki', config = function() vim.g.vimwiki_list = {{syntax = 'markdown', ext = '.md'}} end}
  use 'icalvin102/vimwiki-sync'

  -- MarkdownPreview
  use { "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  }

  -- Formatting
  use {'sbdchd/neoformat', config = function() vim.g.neoformat_try_node_exe = 1 end}

  -- Filetype
  use 'elzr/vim-json'
  use {'leafOfTree/vim-svelte-plugin', config = function() vim.g.vim_svelte_plugin_use_typescript = 1 end}

  -- Utility
  use 'bronson/vim-visual-star-search'
  use 'roxma/nvim-yarp'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    packer.sync()
  end
end)
