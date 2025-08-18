local opts = { noremap = true, silent = true }

local function switch_window(direction)
	return function()
		vim.cmd("wincmd " .. direction)
	end
end

local mappings = {
	-- Window Navigation
	{ { "n", "i", "t" }, "<A-h>", switch_window("h"), { desc = "Switch window left" } },
	{ { "n", "i", "t" }, "<A-j>", switch_window("j"), { desc = "Switch window down" } },
	{ { "n", "i", "t" }, "<A-k>", switch_window("k"), { desc = "Switch window up" } },
	{ { "n", "i", "t" }, "<A-l>", switch_window("l"), { desc = "Switch window right" } },
	{ { "n", "i", "t" }, "<A-p>", switch_window("p"), { desc = "Switch to previous window" } },
}

for _, mapping in ipairs(mappings) do
	vim.keymap.set(
		mapping[1],
		mapping[2],
		mapping[3],
		vim.tbl_extend("force", { noremap = true, silent = true }, mapping[4] or {})
	)
end
