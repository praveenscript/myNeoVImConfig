return {
  {
    "echasnovski/mini.move",
    config = function()
      require("mini.move").setup()
    end,
  },

  {
    "nvim-mini/mini.surround",
    version = false,
    config = function()
      require("mini.surround").setup({
        mappings = {
          add = "<leader>sa",        -- Add surrounding
          delete = "<leader>sd",     -- Delete surrounding
          find = "<leader>sf",       -- Find surrounding (right)
          find_left = "<leader>sF",  -- Find surrounding (left)
          highlight = "<leader>sh",  -- Highlight surrounding
          replace = "<leader>sr",    -- Replace surrounding

          suffix_last = "l",         -- Suffix for "prev" method
          suffix_next = "n",         -- Suffix for "next" method
        },
      })
    end,
  },
}
