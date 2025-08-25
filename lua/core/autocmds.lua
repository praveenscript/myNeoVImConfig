vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})

-- Set relative numbers only in normal mode
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.opt.relativenumber = true
	end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.wo.relativenumber = false
	end,
})
