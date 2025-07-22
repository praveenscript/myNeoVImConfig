local M = {}




function M.setup()
  local function lsp_status()
  local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
  if #clients == 0 then return "🛑 No LSP" end
  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end
  return "🚀 " .. table.concat(names, ", ")
end

  require("lualine").setup({
    options = {
      theme = "dracula", -- picks theme from current colorscheme
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      globalstatus = true, -- single statusline for all windows
    },
    sections = {
      lualine_a = { { "mode", icon = "" } },
      lualine_b = { "branch", "diff" },
      lualine_c = { {
        "filename",
        path = 1, -- relative path
        symbols = { modified = "[+]", readonly = "[RO]", unnamed = "[No Name]" },
      } },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress", lsp_status },
      lualine_z = { { "location", icon = "" } },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    extensions = { "quickfix", "nvim-tree", "fugitive", "lazy" },
  })
end

return M
