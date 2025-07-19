-- ~/.config/nvim/init.lua


-- To check Env
_G.is_termux = vim.fn.executable("termux-info") == 1 and vim.fn.getenv("PREFIX") == "/data/data/com.termux/files/usr"
print("Termux detected:", is_termux)
-- Load core configuration
require('core.options')
require('core.keymaps')
require('core.autocmds')


-- Load if condition for other Env
require('core.custom')
-- Load plugin configurations
require('plugins.init')

-- Load LineNumber configurations
require('utils.line_mode')
require('utils.comments')
require('utils.cursorJump')

-- Shell 
-- if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
--   vim.opt.shell = '"C:\\Program Files\\Git\\usr\\bin\\bash.exe"'

-- end


