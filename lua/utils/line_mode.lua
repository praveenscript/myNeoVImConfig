vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFAA00", bold = true })


-- 🧩 Show absolute + relative line numbers in Neovim using statuscolumn
-- -- vim.opt.number = true
-- -- vim.opt.relativenumber = true
-- -- vim.opt.statuscolumn = "%s %l %r"
vim.api.nvim_create_autocmd("CmdlineEnter", {
	callback = function()
		vim.defer_fn(function()
			vim.wo.relativenumber = false
			vim.wo.number = true
			vim.cmd("redraw")
		end, 10)
	end,
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
	callback = function()
		-- print("🔙 CmdlineLeave triggered — restoring relative line numbers")
		vim.defer_fn(function()
			vim.wo.number = true
			vim.wo.relativenumber = true
		end, 10)
	end,
})
