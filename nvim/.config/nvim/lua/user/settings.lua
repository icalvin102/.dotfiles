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

function set_quickfix_from_svelte_check()
  local command = "npm run check -- --output machine | awk '/ WARNING | ERROR / {print $0}'"
  -- Run the command and get the output
  local lines = vim.fn.systemlist(command)

  -- Parse the output and create quickfix entries
  local entries = {}
  for _, line in ipairs(lines) do
    local parts = vim.split(line, " ")
    local filename = parts[3]:gsub('"', '')
    local linenr, colnr = parts[4]:match("(%d+):(%d+)")
    local message = table.concat(parts, " ", 5):gsub('"', '')
    local type = parts[2] == "ERROR" and "E" or "W"

    -- Create an entry for the quickfix list
    local entry = {
      filename = filename,
      lnum = tonumber(linenr),
      col = tonumber(colnr),
      text = message,
      type = type,
    }

    table.insert(entries, entry)
  end

  -- Set the quickfix list and return the number of entries added
  vim.fn.setqflist(entries)
  vim.cmd('copen')
  return #entries
end

vim.api.nvim_create_user_command('SvelteCheck', set_quickfix_from_svelte_check, {})

-- vim.cmd [[command SvelteCheck call
-- setqflist(
--   map(
--     map(
--       systemlist("npm run check | grep -P '^/home'"),
--       {_, val -> split(val, ':')}
--     ),
--     {_, val -> #{filename: val[0], lnum: val[1], col: val[2]}}
--   )
-- )
-- ]]
