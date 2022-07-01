local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap('n', 'ZZ', ':xa<CR>', opts)

-- Window Navigation
keymap('t', '<A-h>', [[<C-\><C-N><C-w>h]], opts)
keymap('t', '<A-j>', [[<C-\><C-N><C-w>j]], opts)
keymap('t', '<A-k>', [[<C-\><C-N><C-w>k]], opts)
keymap('t', '<A-l>', [[<C-\><C-N><C-w>l]], opts)
keymap('i', '<A-h>', [[<C-\><C-N><C-w>h]], opts)
keymap('i', '<A-j>', [[<C-\><C-N><C-w>j]], opts)
keymap('i', '<A-k>', [[<C-\><C-N><C-w>k]], opts)
keymap('i', '<A-l>', [[<C-\><C-N><C-w>l]], opts)
keymap('n', '<A-h>', '<C-w>h', opts)
keymap('n', '<A-j>', '<C-w>j', opts)
keymap('n', '<A-k>', '<C-w>k', opts)
keymap('n', '<A-l>', '<C-w>l', opts)
