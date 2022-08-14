vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.ruler = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
-- vim.o.noexpandtab = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.cindent = true
vim.o.colorcolumn = 79

vim.o.encoding = 'utf-8'

vim.o.visualbell = true

vim.opt.listchars.tab = '▸ '
vim.opt.listchars.eol = '¬'
vim.o.list = true

vim.cmd [[command SvelteCheck call setqflist(map(map(systemlist("npm run check | grep -P '^/home'"), {_, val -> split(val, ':')}), {_, val -> #{filename: val[0], lnum: val[1], col: val[2]}}))]]
