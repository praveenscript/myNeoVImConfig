-- ~/.config/nvim/init.lua
-- Important
vim.g.mapleader = " "

vim.g.maplocalleader = " "

-- To check Env
_G.is_termux = vim.fn.executable("termux-info") == 1 and vim.fn.getenv("PREFIX") == "/data/data/com.termux/files/usr"
print("Termux detected:", is_termux)
-- Load core configuration
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Load shit idk what even is
-- Add your plugin path to runtime during dev
-- Formatters
require("core.formatting")

-- config debugging
require("utils.lspConfig")


-- git Extra stuff
require("gitLame.init").setup()

-- myPlugins dev work
require("zipper.init")
require("zipper.core")
require("zipper.float")
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.lua",
	group = vim.api.nvim_create_augroup("ReloadLuaConfig", { clear = true }),
	callback = function()
		local filename = vim.api.nvim_buf_get_name(0)
		local config_path = vim.fn.stdpath("config") .. "/lua/"
		local normalized_filename = filename:gsub("\\", "/"):lower()
		local normalized_config = config_path:gsub("\\", "/"):lower()

		print("BufWritePost triggered for:", normalized_filename)

		if normalized_filename:find(normalized_config, 1, true) then
			vim.schedule(function()
				vim.cmd("luafile " .. vim.fn.fnameescape(filename))
				vim.notify("Reloaded: " .. vim.fn.fnamemodify(filename, ":~"), vim.log.levels.INFO)
			end)
		else
			print("Skipped reload: not in config path")
		end
	end,
})
-- Paths Setup for projects/download and other folders
vim.api.nvim_create_user_command("Setup", function()
	require("profiles.profile").setup()
end, {})

-- Telescope
require("mytelescope.main")

require("core.custom")
-- Load plugin configurations
require("plugins.lazy-init")
-- Load Commander
require("mytelescope.Commander")
-- Load LineNumber configurations
require("utils.line_mode")
require("utils.comments")
require("utils.cursorJump")

-- Insert Mode
vim.keymap.set("i", "<C-M-h>", "<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = true, silent = true })
-- Speed PasteLine >>
require("utils.speedPaste")
require("utils.stashPeek")
-- Telescope Speed Paster Picker
-- require('mytelescope.teleportation')
-- For Termux
require("termux.clipboardFix")
-- To reload
