return function()
	local ls = require("luasnip")

	vim.keymap.set({ "i", "s" }, "<c-k>", function()
		if ls.expand_or_jumpable() then
			ls.expand_or_jump()
		end
	end, { silent = true, desc = "Luasnip expand or jump up" })

	vim.keymap.set({ "i", "s" }, "<c-j>", function()
		if ls.jumpable(-1) then
			ls.jump(-1)
		end
	end, { silent = true, desc = "Luasnip jump down" })

	ls.add_snippets("svelte", {
		ls.parser.parse_snippet(
			"page",
			'<script lang="ts" context="module">\n\texport async function load({url, session}) {\n\t\t$1\n\t}\n</script>\n\n<script lang="ts">\n\t$2\n</script>\n$0'
		),
	})
end
