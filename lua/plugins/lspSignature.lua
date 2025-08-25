return {
	"ray-x/lsp_signature.nvim",
	config = function()
		require("lsp_signature").setup({
			bind = true,
			hint_enable = true,
			floating_window = true,
			handler_opts = {
				border = "rounded",
			},
		})
	end,
}
