-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


plugins = {
  -- LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'hrsh7th/cmp-nvim-lsp',
    },
    config = require('user.lsp')
  },

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        config = require('user.luasnip')
      },
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
    },
    config = require('user.cmp')
  },

  -- Tresitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/playground'
    },
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {
        'bash',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'typescript',
        'svelte',
        'javascript',
        'json',
        'python'
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = {  },
      },
      indent = { enable = true, disable = {  } },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        persist_queries = false,
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
      },
    },
  },

  -- Colorscheme
  {
    'npxbr/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    branch = 'main',
    config = function()
      vim.cmd [[
      syntax on
      set termguicolors
      colorscheme gruvbox
      ]]
    end
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    },
    config = require('user.telescope')
  },

  -- Git
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',

      'nvim-telescope/telescope.nvim', -- optional
    },
    config = true,
    keys = {
      { '<leader>gs', '<cmd>Neogit<cr>', desc = 'Neogit Open' },
      { '<leader>gc', '<cmd>Neogit commit<cr>', desc = 'Neogit Commit' },
      { '<leader>gp', '<cmd>Neogit pull<cr>', desc = 'Neogit Pull' },
      { '<leader>gP', '<cmd>Neogit push<cr>', desc = 'Neogit Push' },
      { '<leader>gb', '<cmd>Telescope git_branches<cr>', desc = 'Telescope Git Branches' },
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    cmd = 'Gitsigns',
    lazy = false,
    config = true
  },

  -- Vimwiki
  {
    'vimwiki/vimwiki',
    config = function() vim.g.vimwiki_list = {{syntax = 'markdown', ext = '.md'}} end
  },

  -- Filetype
  'elzr/vim-json',
  {
    'leafOfTree/vim-svelte-plugin',
    config = function()
      vim.g.vim_svelte_plugin_use_typescript = 1
    end
  },

  -- Utilitiy
  'bronson/vim-visual-star-search',
  'roxma/nvim-yarp',

  -- Mini.nvim
  { 'echasnovski/mini.ai',
    version = false,
    config = true,
    main = 'mini.ai',
  },
  { 'echasnovski/mini.comment',
    version = false,
    config = true,
    main = 'mini.comment',
  },
  { 'echasnovski/mini.statusline',
    version = false,
    config = true,
    main = 'mini.statusline',
  },
}

require('lazy').setup({
  spec = plugins,
  checker = { enabled = true }
})
