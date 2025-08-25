return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettier.with({
					filetypes = { "javascript", "typescript", "python" },
					extra_args = { "--use-tabs", "--tab-width", "8", "--print-width", "120" },
				}),
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.stylua,
			},
		})
	end,
}
