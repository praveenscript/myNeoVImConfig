vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFAA00", bold = true })






vim.api.nvim_create_autocmd("CmdlineEnter", {
  callback = function()
    vim.defer_fn(function()
      vim.wo.relativenumber = false
      vim.wo.number = true
      vim.cmd("redraw")  -- Force UI update
    --   print("🔔 Switched to absolute line numbers")
    end, 10)
  end,
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function()
    -- print("🔙 CmdlineLeave triggered — restoring relative line numbers")
    vim.defer_fn(function()
      vim.wo.number = true
      vim.wo.relativenumber = true
    end, 10)
  end,
})