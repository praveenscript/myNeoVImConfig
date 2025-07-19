local local_jump_history = {}
local current_index = {}

vim.api.nvim_create_autocmd("CursorMoved", {
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local pos = vim.api.nvim_win_get_cursor(0)

    local_jump_history[bufnr] = local_jump_history[bufnr] or {}
    table.insert(local_jump_history[bufnr], pos)
    current_index[bufnr] = #local_jump_history[bufnr]
  end,
})

vim.keymap.set("n", "<C-S-o>", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local hist = local_jump_history[bufnr]

  if hist and current_index[bufnr] and current_index[bufnr] > 1 then
    current_index[bufnr] = current_index[bufnr] - 1
    local pos = hist[current_index[bufnr]]
    vim.api.nvim_win_set_cursor(0, pos)
  end
end, { desc = "Jump back in current buffer history" })