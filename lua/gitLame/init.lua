local ui = require("gitLame.gitMenu")
local utils = require("gitLame.utils")

local M = {}

M.setup = function()
  vim.keymap.set("n", "<leader>ge", ui.show_feature_picker, { desc = "Git Extra: Feature Picker" })
end

return M