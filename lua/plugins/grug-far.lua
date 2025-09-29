return {
	"MagicDuck/grug-far.nvim",
	config = function()
		require("grug-far").setup({})

		vim.keymap.set("n", "<leader>sr", function()
			require("grug-far").open()
		end, { desc = "GrugFar: open search UI" })
	end,
}

