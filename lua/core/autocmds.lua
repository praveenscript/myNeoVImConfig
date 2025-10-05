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

-- Restarts Neovim
vim.api.nvim_create_user_command("RestartNvim", function()
	local cmd = [[silent !powershell -ExecutionPolicy Bypass -File "C:\scripts\restart-nvim.ps1"]]
	vim.cmd(cmd)
	vim.cmd("qa")
end, {})
