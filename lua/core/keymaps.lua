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

-- function wrappers
vim.keymap.set("n", "<leader>wf", function()
  local word = vim.fn.expand("<cword>")
  local func = vim.fn.input("Function: ")
  local wrapped = func .. "(" .. word .. ")"
  vim.api.nvim_set_current_line(
    vim.fn.getline("."):gsub(word, wrapped, 1)
  )
  -- Move cursor to just after the function name and open insert mode
  local col = vim.fn.col(".")
  vim.cmd("normal! 0")
  vim.cmd("normal! /" .. func .. "<CR>")
  vim.cmd("normal! f(i")
end, { noremap = true, silent = true })



