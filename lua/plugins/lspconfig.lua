return { -- Main LSP Configuration
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs and related tools to stdpath for Neovim
		-- Mason must be loaded before its dependents so we need to set it up here.
		-- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		-- "WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Useful status updates for LSP.
		{ "j-hui/fidget.nvim",    opts = {} },

		-- Allows extra capabilities provided by blink.cmp
	},
	config = function()
		-- local capabilities = require("blink.lsp").default_capabilities()

		-- local function suppress_signature_help(_, _)
		-- 	vim.lsp.handlers["textDocument/signatureHelp"] = function()
		-- 		print("supressing signature Help")
		-- 	end
		-- end

		vim.lsp.config("lua_ls", {

			-- on_attach = suppress_signature_help,
			settings = {
				lua = {
					runtime = {
						version = "LuaJit",
					},
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		vim.lsp.enable("lua_ls")
	end,
}
