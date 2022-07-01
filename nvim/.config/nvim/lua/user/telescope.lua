return function()
  require('telescope').setup{
    defaults = {
      borderchars = { '═', '║', '═', '║', '╔', '╗', '╝', '╚' },
      scroll_strategy = 'limit',
    }
  }

  local tb = require('telescope.builtin')
  local keymap = vim.api.nvim_set_keymap

  local find_buffers = function()
    tb.buffers({
      sort_mru = true,
      ignore_current_buffer = true,
      previewer = false
    })
  end

  keymap('n', '<leader>ff', '', { noremap = true, callback = tb.find_files })
  keymap('n', '<leader>fb', '', { noremap = true, callback = find_buffers })
  keymap('n', '<leader>fh', '', { noremap = true, callback = tb.help_tags })
  keymap('n', '<leader>ld', '', { noremap = true, callback = tb.diagnostics })
  keymap('n', '<leader>gb', '', { noremap = true, callback = tb.git_branches })
end
