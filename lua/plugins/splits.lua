return{
  "hiattp/splitwise.nvim",
  event = "VeryLazy", -- or "BufReadPost" if you want it earlier
  config = function()
    require("splitwise").setup({
      behavior = {
        create_if_missing = true,      -- Auto-create split if none exists
        wrap_around = false,           -- Prevent wrapping to opposite edge
        resize_mode = false,           -- Don't resize windows on edge
        max_columns = 3,               -- Max vertical splits allowed
        max_rows = 3,                  -- Max horizontal splits allowed
      },
      ui = {
        border = "none",               -- No border around new splits
        highlight = "Visual",          -- Highlight when moving
        animation = false,             -- Disable animation for speed
      }
    })
require("splitwise").setup({ create_default_keymaps = false })

vim.keymap.set("n", "<leader>rh", require("splitwise").move_left,  { desc = "Splitwise left" })
vim.keymap.set("n", "<leader>rj", require("splitwise").move_down,  { desc = "Splitwise down" })
vim.keymap.set("n", "<leader>rk", require("splitwise").move_up,    { desc = "Splitwise up" })
vim.keymap.set("n", "<leader>rl", require("splitwise").move_right, { desc = "Splitwise right" })
  end
} 