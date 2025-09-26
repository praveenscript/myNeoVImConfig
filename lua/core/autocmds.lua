AutoFormatOnWrite = true

if AutoFormatOnWrite then
	vim.api.nvim_create_autocmd("BufWritePre", {
		callback = function()
			vim.lsp.buf.format({ async = false })
		end,
	})
end

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
  local cmd = [[silent !powershell -ExecutionPolicy Bypass -File "C:\scripts\nvim-restart.ps1"]]
  vim.cmd(cmd)
  vim.cmd("qa")
end, {})

-- Autostarts :w for css, html editing stuff

local autosave_timer = nil

function StartConditionalAutosave()
	if autosave_timer then
		return
	end -- prevent multiple timers

	AutoFormatOnWrite = false

	autosave_timer = vim.loop.new_timer()
	autosave_timer:start(
		0,
		3000,
		vim.schedule_wrap(function()
			local diagnostics = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
			if #diagnostics == 0 then
				vim.cmd("silent! write")
			end
		end)
	)

	print("🔁 Conditional autosave started (every 3s, skips on LSP errors)")
end

function StopConditionalAutosave()
	if autosave_timer then
		autosave_timer:stop()
		autosave_timer:close()
		autosave_timer = nil
		AutoFormatOnWrite = true
		print("🛑 Conditional autosave stopped")
	else
		print("⚠️ No autosave timer running")
	end
end

vim.api.nvim_create_user_command("AutoSaveStart", StartConditionalAutosave, {})
vim.api.nvim_create_user_command("AutoSaveStop", StopConditionalAutosave, {})

