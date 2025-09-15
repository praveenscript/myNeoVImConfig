local M = {}

local utils = require("gitLame.utils")

M.show_feature_picker = function()
  local current_selected_buffer = vim.api.nvim_buf_get_name(0)
  local buffer_name = utils.get_current_filename(current_selected_buffer)
  local listed_buffers = vim.fn.getbufinfo({ buflisted = 1 })
  local content = {
    "Selected Buffer " .. tostring(buffer_name)
  }

  local all_commands = vim.api.nvim_get_commands({})
  local git_commands = {}

  for name, cmd in pairs(all_commands) do
  if name:match("^Git") then
    table.insert(git_commands, {
      name = "[[" .. name .. "]]",
      definition = cmd.definition or "",
    })
  end
end

  for index, item in ipairs(git_commands) do
    table.insert(content, tostring(index) .. " " ..  item.name .. " " .. item.definition) 
  end

  local buf = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)


  -- Create a floating window
  local width = 120
  local height = 30
  
  local win = vim.api.nvim_open_win(buf, true, {
    relative= 'editor',
    width = width,
    height = height,
    col = math.floor((vim.o.columns -width) / 2),
    row = math.floor((vim.o.lines - height)/ 2),
    style = 'minimal',
    border = 'single',
    title = "GitLame Menu"
  })
  -- Highlight current line
  vim.api.nvim_win_set_option(win, "cursorline", true)



  vim.keymap.set('n', 'q', function()
  if vim.api.nvim_win_is_valid(win) then 
    vim.api.nvim_win_close(win, true)
  end
end, { buffer = buf})

vim.keymap.set("n", "<CR>", function()
  local line = vim.fn.getline(".")  -- lowercase 'getline', not 'getLine'
  local cmd_name = line:match("%[%[(.-)%]%]")  -- match command inside [[ ]]
  print(cmd_name)
  if cmd_name then
    utils.run_git_command(cmd_name)
  else
    vim.notify("No valid command found on this line", vim.log.levels.WARN)
  end
end, { buffer = buf })

end

return M