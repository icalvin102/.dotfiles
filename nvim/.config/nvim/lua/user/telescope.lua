return function()
	require("telescope").setup({
		defaults = {
			borderchars = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },
			scroll_strategy = "limit",
		},
	})

	local tb = require("telescope.builtin")

	local find_buffers = function()
		tb.buffers({
			sort_mru = true,
			ignore_current_buffer = true,
			previewer = false,
		})
	end

	vim.keymap.set("n", "<leader>ff", tb.find_files, { noremap = true})
	vim.keymap.set("n", "<leader>fb", find_buffers, { noremap = true})
	vim.keymap.set("n", "<leader>fh", tb.help_tags, { noremap = true})
	vim.keymap.set("n", "<leader>ld", tb.diagnostics, { noremap = true})
	vim.keymap.set("n", "<leader>gb", tb.git_branches, { noremap = true})
end
