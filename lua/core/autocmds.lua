vim.api.nvim_create_autocmd("FileType", {
  pattern = "javascript",
  callback = function()
    vim.opt_local.tabstop = 4        -- visual width of a tab character
    vim.opt_local.shiftwidth = 4     -- spaces used for autoindent
    vim.opt_local.softtabstop = 4    -- spaces when pressing <Tab>
    vim.opt_local.expandtab = true   -- convert tabs to spaces
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})


-- Set relative numbers only in normal mode
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.opt.relativenumber = true
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.opt.relativenumber = false
  end,
})



