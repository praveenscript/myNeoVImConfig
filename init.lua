-- ~/.config/nvim/init.lua

-- Load core configuration
require('core.options')
require('core.keymaps')
require('core.autocmds')

-- Load plugin configurations
require('plugins.init')

-- Load LineNumber configurations
require('utils.line_mode')
require('utils.comments')

