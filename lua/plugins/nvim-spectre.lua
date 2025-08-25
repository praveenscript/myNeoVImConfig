return {
	"nvim-pack/nvim-spectre",
	cmd = "Spectre",
	keys = {
		{
			"<leader>sr",
			function() require("spectre").toggle() end,
			desc = "Toggle Spectre (Search & Replace)",
		},
	},
	opts = {
		open_cmd = "vnew", -- or "new" for horizontal split
		live_update = true, -- auto-refresh results
		is_insert_mode = true, -- start in insert mode
	},
}
