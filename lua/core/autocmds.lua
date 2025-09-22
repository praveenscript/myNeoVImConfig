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

-- changes the current cwd to the current focused file/buffer

vim.api.nvim_create_user_command("SetCWDToFile", function()
	local file_path = vim.api.nvim_buf_get_name(0)
	if file_path == "" then
		print("No file open.")
		return
	end
	local dir = vim.fn.fnamemodify(file_path, ":h")
	vim.cmd("cd " .. dir)
	print("CWD set to: " .. dir)
end, {})
