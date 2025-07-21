return {
  "lukas-reineke/indent-blankline.nvim",
  name = "indent-blankline.nvim",
  main = "ibl",
  lazy = true,
  opts = {
    indent = { char = "|" },
    scope = {
    --   enabled = true,
      show_start = false,
      show_end = false,
    },
  },
  config = function()
    vim.api.nvim_set_hl(0, "IblIndent", { link = "Whitespace" })
    -- vim.api.nvim_set_hl(0, "IblScope", { fg = "#8941a6", bold = true })       -- neon pink for scope lines
  end,
  keys = {
    {
      "<leader>ii",
      function()
        vim.cmd("Lazy load indent-blankline.nvim")
        vim.cmd("IBLToggle")
      end,
      desc = "Toggle indent guides",
    },
  },
}