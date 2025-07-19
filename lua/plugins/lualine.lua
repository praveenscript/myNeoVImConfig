return {
  -- Lualine block
  {
    "nvim-lualine/lualine.nvim",
    enabled = not _G.is_termux,
    config = function()
      print("[Debug] Loading lualine: is_termux =", _G.is_termux)
      require("lualine").setup({
        options = {
          theme = "auto",
          globalstatus = true,
          section_separators = "",
          component_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {},
          lualine_c = { { "filename", path = 1 } },
          lualine_x = {},
          lualine_y = { "filetype" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  -- mini.statusline block
  {
    "echasnovski/mini.statusline",
    enabled = _G.is_termux,
    config = function()
      print("[Debug] Loading mini.statusline: is_termux =", _G.is_termux)
      require("mini.statusline").setup({
        use_icons = false,
      })
    end,
  },
}