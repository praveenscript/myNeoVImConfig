return {
	{
		"bfredl/nvim-luadev",
		config = function()
			vim.cmd([[command! LuaDev lua require('luadev').setup()]])
		end,
	},
	{
		"kikito/inspect.lua",
		name = "inspect",
		lazy = true,
	},
}
