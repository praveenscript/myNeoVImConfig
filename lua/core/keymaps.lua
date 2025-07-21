-- ~/.config/nvim/lua/core/keymaps.lua

local keymap = vim.keymap.set

-- General mappings
keymap('n', '<leader>sv', ':vsplit<CR>', { desc = 'Vertical split' })

-- Plugin mappings will go in their respective files

-- Keymaps for workspace management
vim.keymap.set("n", "<leader>{", "<cmd>Telescope session-lens search_session<CR>", {
  desc = "Search workspaces (VS Code style)"
})

-- Close floating windows/plugins with <leader>esc
vim.keymap.set('n', '<leader>esc', function()
  local wins = vim.api.nvim_list_wins()
  for _, win in ipairs(wins) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= '' then -- Is a floating window
      vim.api.nvim_win_close(win, false)
    end
  end
end, { desc = 'Close all plugin UIs' })

-- To Reload
vim.api.nvim_create_user_command("Reload", function()
  -- Clear and reload your keymaps module
  package.loaded["keymaps"] = nil
  require("core.keymaps")

  -- Optionally reload other configs if needed
  -- package.loaded["options"] = nil
  -- require("options")

  print("🔁 Reloaded keymaps.lua!")
end, { desc = "Reload keymaps without restarting" })

-- To Comment

vim.keymap.set("n", "<C-_>", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("v", "<C-_>", "gc", { remap = true, desc = "Toggle comment" })


-- Oil File Manager
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Open Oil File Manager" })

-- Delete Buffer
vim.keymap.set("n", "<leader>bd", function()
  local bufnr = vim.fn.input("Buffer number to delete: ")
  vim.cmd("bd " .. bufnr)
end, { desc = "Delete buffer by number" })







-- Telescope Fuzzy Search workspaces (VS Code style)
vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Fuzzy word search" })
-- Telescope Fuzzy tab search
vim.keymap.set("n", "<leader>tt", "<cmd>Telescope tabs<CR>", { desc = "Switch Tabs" })


--nvim nvim-tree
vim.keymap.set("n", "<leader>ft", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

-- LIve LiveServer
vim.keymap.set("n", "<leader>ls", ":!live-server .<CR>", { desc = "Start live-server" })


-- Bonus: Also works in insert mode
-- vim.keymap.set('i', '<leader>esc', '<ESC><cmd>lua require("utils").close_floats()<CR>')

-- Increase/decrease right window width
vim.keymap.set("n", "<A-l>", ":vertical resize +5<CR>", { silent = true })
vim.keymap.set("n", "<A-h>", ":vertical resize -5<CR>", { silent = true })

-- Increase/decrease window height (useful for horizontal splits)
vim.keymap.set("n", "<A-k>", ":resize +5<CR>", { silent = true })
vim.keymap.set("n", "<A-j>", ":resize -5<CR>", { silent = true })

-- Clipboard stuff
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
-- Correct Termux pasting problem by disabling formatting when it tries to paste
local is_termux = vim.g.is_termux  -- assuming you've set this globally elsewhere

vim.keymap.set("n", "<leader>p", function()
  if is_termux then
    vim.opt.paste = true
  end
  vim.cmd('normal "+p')  -- paste from system clipboard
  if is_termux then
    vim.opt.paste = false
  end
end, { desc = "Smart paste (Termux-aware)" })

-- Telescope To open Recent files
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", {
  desc = "Find recently opened files"
})

-- Telescope to open hidden files
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope find_files hidden=true no_ignore=true<CR>", {
  desc = "Find hidden files"
})

-- Telescope Helpers Switch Menu
vim.keymap.set("n", "<leader>ii", "<cmd>IBLToggle<cr>", { desc = "Toggle indent guides" })

