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
		local tb = require("telescope.builtin")

		local function mk_opts(desc)
			return { noremap = true, silent = true, buffer = bufnr, desc = desc }
		end

		-- See `:help vim.lsp.*` for documentation on any of the below functions
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, mk_opts("Signature Help"))
		vim.keymap.set("n", "<leader>D", tb.lsp_type_definitions, mk_opts("Type [D]efinition"))
		vim.keymap.set("n", "<leader>ds", tb.lsp_document_symbols, mk_opts("[D]ocument [S]ymbols"))
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, mk_opts("Show [E]rror"))
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, mk_opts("Open Diagnostics List"))
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, mk_opts("[R]e[n]ame"))
		vim.keymap.set("n", "<leader>ws", tb.lsp_dynamic_workspace_symbols, mk_opts("[W]orkspace [S]ymbols"))
		vim.keymap.set("n", "K", vim.lsp.buf.hover, mk_opts("Hover Documentation"))
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, mk_opts("Go to Previous Diagnostic"))
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, mk_opts("Go to Next Diagnostic"))
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, mk_opts("[G]oto [D]eclaration"))
		vim.keymap.set("n", "gI", tb.lsp_implementations, mk_opts("[G]oto [I]mplementation"))
		vim.keymap.set("n", "gd", tb.lsp_definitions, mk_opts("[G]oto [D]efinition"))
		vim.keymap.set("n", "gr", tb.lsp_references, mk_opts("[G]oto [R]eferences"))
		vim.keymap.set("v", "<leader>f", format, mk_opts("[F]ormat Selection"))
		vim.keymap.set({ "n", "v", "x" }, "<leader>ca", vim.lsp.buf.code_action, mk_opts("[C]ode [A]ction"))
		vim.keymap.set({ "n", "v" }, "<leader>f", format, mk_opts("[F]ormat"))
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
				settings = servers[server_name] or {},
				flags = {
					debounce_text_changes = 150,
				},
			})
		end,
	})
end
