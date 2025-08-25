return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			-- Install servers with Mason
			require("mason-lspconfig").setup({
				ensure_installed = { "ts_ls", "jsonls", "clangd" }, -- ✅ new server name
				automatic_installation = false,
			})

			-- Set up handlers for installed servers
			local lspconfig = require("lspconfig")

			on_attach = function(client, bufnr)
				-- Enable signature help
				require("lsp_signature").on_attach({
					bind = true,
					floating_window = true,
					hint_enable = true,
					handler_opts = {
						border = "rounded",
					},
				}, bufnr)

				-- You can add more per-server stuff here (keymaps, etc)
			end

			--local on_attach = require("on_attach").on_attach
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			--   require("mason-lspconfig").setup_handlers({
			--     function(server_name)
			--       lspconfig[server_name].setup({
			--         capabilities = capabilities,
			--       })
			--     end,
			--   })
		end,
	},
}
