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
          add = "ys",               -- Add surrounding
          delete = "ds",            -- Delete surrounding
          find = "<leader>sf",      -- Find surrounding (right)
          find_left = "<leader>sF", -- Find surrounding (left)
          highlight = "<leader>sh", -- Highlight surrounding
          replace = "cs",           -- Replace surrounding

          suffix_last = "l",        -- Suffix for "prev" method
          suffix_next = "n",        -- Suffix for "next" method
        },
      })
    end,
  },
  {
    "nvim-mini/mini.operators",
    config = function()
      require("mini.operators").setup({
        mappings = {
          evaluate = "ie",
          exchange = "ix",
          multiply = "im",
          replace = "ir",
          sort = "is",
        },
      })
    end,
  }
}
