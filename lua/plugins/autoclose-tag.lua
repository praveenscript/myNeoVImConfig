require("nvim-ts-autotag").setup({
	opts = {
		enable_close = true, -- auto-close tags
		enable_rename = true, -- auto-rename paired tags
		enable_close_on_slash = false, -- optional: close on trailing </
	},
	per_filetype = {
		["html"] = { enable_close = false }, -- override per filetype
	},
})
