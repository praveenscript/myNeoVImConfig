-- ~/.config/nvim/lua/core/keymaps.lua

local keymap = vim.keymap.set

-- Keymaps for workspace management
vim.keymap.set("n", "<leader>{", "<cmd>Telescope session-lens search_session<CR>", {
  desc = "Search workspaces (VS Code style)"
})

-- LIve LiveServer
vim.keymap.set("n", "<leader>ls", ":!live-server .<CR>", { desc = "Start live-server" })

-- Increase/decrease right window width
vim.keymap.set("n", "<A-l>", ":vertical resize +5<CR>", { silent = true })
vim.keymap.set("n", "<A-h>", ":vertical resize -5<CR>", { silent = true })

-- Increase/decrease window height (useful for horizontal splits)
vim.keymap.set("n", "<A-k>", ":resize +5<CR>", { silent = true })
vim.keymap.set("n", "<A-j>", ":resize -5<CR>", { silent = true })

-- Toggles indent on/off
vim.keymap.set("n", "<leader>ii", "<cmd>IBLToggle<cr>", { desc = "Toggle indent guides" })


