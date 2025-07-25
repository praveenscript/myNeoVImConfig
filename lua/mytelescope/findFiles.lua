
vim.keymap.set("n", "<leader>fh", function()
  require("telescope.builtin").find_files({
    hidden = true,
    no_ignore = true
  })
end, { desc = "Find hidden files" })
