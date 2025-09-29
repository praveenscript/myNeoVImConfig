-- ~/.config/nvim/init.lua
-- Important
vim.g.mapleader = " "

vim.g.maplocalleader = "," -- Local leader (e.g. <localleader>r for Grug-FAR)


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



-- Fzf 
require("fzf.commander")
require("fzf.fzf-keymaps")
require("fzf.fzfPaste")

require("core.custom")
-- Load plugin configurations
require("plugins.lazy-init")
-- Load Commander
-- Load LineNumber configurations
require("utils.line_mode")
require("utils.comments")
require("utils.cursorJump")


-- Speed PasteLine >>
require("utils.speedPaste")
require("utils.stashPeek")

-- For Termux
require("termux.clipboardFix")
-- To reload
