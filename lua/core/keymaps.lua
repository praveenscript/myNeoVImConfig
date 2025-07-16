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
    if config.relative ~= '' then  -- Is a floating window
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



-- Function To reload config
function _G.ReloadConfig()
  for name, _ in pairs(package.loaded) do
    if name:match("^core") or name:match("^plugins") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
  print("🔄 Reloaded core and plugin modules!")
end

vim.api.nvim_create_user_command("ReloadConfig", ReloadConfig, {})


-- Telescope Fuzzy Search workspaces (VS Code style)
vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Fuzzy word search" })





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