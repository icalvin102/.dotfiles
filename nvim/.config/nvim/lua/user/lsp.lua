return function()
	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")

	-- Include the servers you want to have installed by default below
	local servers = {
		cssls = {},
		eslint = {},
		graphql = {},
		html = {},
		jsonls = {},
		rust_analyzer = {},
		svelte = {},
		tailwindcss = {},
		ts_ls = {},
		lua_ls = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	}

	local function format()
		local status, null_ls_sources = pcall(require, "null-ls.sources")
		if status then
			local ft = vim.bo.filetype

			local has_null_ls = #null_ls_sources.get_available(ft, "NULL_LS_FORMATTING") > 0

			vim.lsp.buf.format({
				filter = function(client)
					if has_null_ls then
						return client.name == "null-ls"
					else
						return true
					end
				end,
			})
		else
			vim.lsp.buf.format()
		end
	end

	local on_attach = function(_, bufnr)
		-- Enable completion triggered by <c-x><c-o>
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

		-- Mappings.
		local opts = { noremap = true, silent = true, buffer = bufnr }

		-- See `:help vim.lsp.*` for documentation on any of the below functions
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		vim.keymap.set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
		vim.keymap.set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
		vim.keymap.set("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
		vim.keymap.set("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
		vim.keymap.set("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
		vim.keymap.set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
		vim.keymap.set("v", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		vim.keymap.set("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
		vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
		vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
		vim.keymap.set("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
		vim.keymap.set("n", "<space>f", format, opts)
		vim.keymap.set("v", "<space>f", format, opts)
	end

	-- Setup
	mason.setup({})

	mason_lspconfig.setup({
		ensure_installed = vim.tbl_keys(servers),
	})

	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

	mason_lspconfig.setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = servers[server_name],
				flags = {
					debounce_text_changes = 150,
				},
			})
		end,
	})
end
