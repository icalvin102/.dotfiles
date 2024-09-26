local opts = { noremap = true, silent = true }

vim.keymap.set("n", "ZZ", ":xa<CR>", opts)

-- Window Navigation
vim.keymap.set("t", "<A-h>", [[<C-\><C-N><C-w>h]], opts)
vim.keymap.set("t", "<A-j>", [[<C-\><C-N><C-w>j]], opts)
vim.keymap.set("t", "<A-k>", [[<C-\><C-N><C-w>k]], opts)
vim.keymap.set("t", "<A-l>", [[<C-\><C-N><C-w>l]], opts)
vim.keymap.set("i", "<A-h>", [[<C-\><C-N><C-w>h]], opts)
vim.keymap.set("i", "<A-j>", [[<C-\><C-N><C-w>j]], opts)
vim.keymap.set("i", "<A-k>", [[<C-\><C-N><C-w>k]], opts)
vim.keymap.set("i", "<A-l>", [[<C-\><C-N><C-w>l]], opts)
vim.keymap.set("n", "<A-h>", "<C-w>h", opts)
vim.keymap.set("n", "<A-j>", "<C-w>j", opts)
vim.keymap.set("n", "<A-k>", "<C-w>k", opts)
vim.keymap.set("n", "<A-l>", "<C-w>l", opts)
