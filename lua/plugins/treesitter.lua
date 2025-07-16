return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- Auto-install parsers
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "python", "javascript", "typescript", "bash" }, -- Add your languages
      highlight = { enable = true },
      indent = { enable = true },                                                 -- Better auto-indentation
      incremental_selection = {                                                   -- Ctrl+↑/↓ to expand/shrink selection
        enable = true,
        keymaps = {
          init_selection = "<C-Up>",
          node_incremental = "<C-Up>",
          scope_incremental = "<C-Down>",
          node_decremental = "<C-Down>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically move forward to textobject

          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
        },
      },

    })
  end
}

