return{
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      cmdline = {
        enabled = true,
        view = "cmdline_popup", -- or "cmdline" for top-line
        format = {
          cmdline = { pattern = "^:", icon = "", lang = "vim" },
          search_down = { pattern = "^/", icon = " ", lang = "regex" },
          search_up = { pattern = "^%?", icon = " ", lang = "regex" },
          filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
          lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
        },
      },
      messages = {
        enabled = true,
        view = "mini", -- or "notify" if using nvim-notify
      },
      popupmenu = {
        enabled = true,
        backend = "nui",
      },
      views = {
        cmdline_popup = {
          position = {
            row = "50%",
            col = "50%",
          },
          size = {
            width = "60%",
          },
          border = {
            style = "single",
            padding = { left = 1, right = 1 },
          },
        },
      },
      presets = {
        bottom_search = false, -- use popup for search
        command_palette = true, -- position cmdline and popupmenu together
        long_message_to_split = true, -- long messages go to split
        inc_rename = false,
        lsp_doc_border = true,
      },
    })
  end,
} 