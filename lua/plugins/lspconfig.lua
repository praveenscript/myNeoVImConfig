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

		opts = {
			ensure_installed = { "css-lsp" }, -- Optional: auto-install via Mason
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				cssls = function()
					require("lspconfig").cssls.setup({
						cmd = { "vscode-css-language-server", "--stdio" },
						filetypes = { "css", "scss", "less" },
						settings = {
							css = { validate = true },
							scss = { validate = true },
							less = { validate = true },
						},
					})
				end,
			},
    servers = {
      emmet_ls = {
        filetypes = {
          "html", "css", "javascript", "javascriptreact",
          "typescript", "typescriptreact", "svelte", "vue", "tsx", "jsx"
        },
        init_options = {
          html = {
            options = {
              ["bem.enabled"] = true, -- Optional: enable BEM-style expansions
            },
          },
        },
      },
    },


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
