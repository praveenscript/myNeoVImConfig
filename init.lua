-- ~/.config/nvim/init.lua
-- Important
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- To check Env
_G.is_termux = vim.fn.executable("termux-info") == 1 and vim.fn.getenv("PREFIX") == "/data/data/com.termux/files/usr"
print("Termux detected:", is_termux)
-- Load core configuration
require('core.options')
require('core.keymaps')
require('core.autocmds')

-- Formatters
require('core.formatting')


-- Load if condition for other Env
require('core.custom')
-- Load plugin configurations
require('plugins.lazy-init')

-- Load LineNumber configurations
require('utils.line_mode')
require('utils.comments')
require('utils.cursorJump')

-- Speed PasteLine >>
require('utils.speedPaste')
-- Telescope Speed Paster Picker
-- require('mytelescope.teleportation')
-- For Termux
require('termux.clipboardFix')
-- To reload
function _G.ReloadConfig()
  for name, _ in pairs(package.loaded) do
    if name:match("^core") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
  vim.notify("Neovim config reloaded!", vim.log.levels.INFO)
end

vim.keymap.set("n", "<leader><CR>", "<cmd>lua ReloadConfig()<CR>", { noremap = true, silent = true })
