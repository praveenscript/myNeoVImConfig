-- Telescope Fuzzy Search workspaces (VS Code style)
print("From Telescope Keymaps")
vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Fuzzy word search" })

vim.keymap.set("n", "<leader>ff", function()
  local root = vim.env.HOME -- Full system root (can use vim.env.HOME for user directory)

  require("telescope.builtin").find_files({
    cwd = root,
    find_command = { "fd", "--type", "f", "--hidden", "--follow", "--exclude", ".git" },
    previewer = false,
    prompt_title = "Search Files🔍",
  })
end, {
  desc = "Searchs all files using fd",
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {
  desc = 'Live Grep'
})

vim.keymap.set('n', '<leader>fb', builtin.buffers, {
  desc = 'Find Buffers'
})
vim.keymap.set('n', '<leader>rr', builtin.registers, {
  desc = "Find registers"
})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {
  desc = 'Help Tags'
})
