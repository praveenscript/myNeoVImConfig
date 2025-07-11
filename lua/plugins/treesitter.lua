return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",  -- Auto-install parsers
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "python", "javascript", "typescript", "bash" }, -- Add your languages
      highlight = { enable = true },
      indent = { enable = true },  -- Better auto-indentation
      incremental_selection = {    -- Ctrl+↑/↓ to expand/shrink selection
        enable = true,
        keymaps = {
          init_selection = "<C-Up>",
          node_incremental = "<C-Up>",
          scope_incremental = "<C-Down>",
          node_decremental = "<C-Down>",
        },
      },
    })
  end
}