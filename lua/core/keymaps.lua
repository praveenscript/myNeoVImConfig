-- ~/.config/nvim/lua/core/keymaps.lua

local keymap = vim.keymap.set

-- LIve LiveServer
vim.keymap.set("n", "<leader>ls", ":!live-server .<CR>", { desc = "Start live-server" })

-- Toggles indent on/off
vim.keymap.set("n", "<leader>ii", "<cmd>IBLToggle<cr>", { desc = "Toggle indent guides" })
