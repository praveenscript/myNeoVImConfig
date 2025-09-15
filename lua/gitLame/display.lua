local M = {}

M.show = function(lines, opts)
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local title = opts and opts.title or "Git Extra"
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.6)
  local win_opts = {
    relative = "editor",
    width = width,
    height = height,
    row = (vim.o.lines - height) / 2,
    col = (vim.o.columns - width) / 2,
    style = "minimal",
    border = "rounded",
    title = title,
    title_pos = "center",
  }

  vim.api.nvim_open_win(buf, true, win_opts)
  vim.api.nvim_buf_set_option(buf, "filetype", "gitextra")
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
end

return M