vim.keymap.set("n", "gp", function()
  local original_rnu = vim.wo.relativenumber
  local original_nu = vim.wo.number

  -- 🟢 Enable relative number mode while prompting
  vim.wo.relativenumber = true
  vim.wo.number = true
  vim.cmd("redraw") -- force UI refresh

  vim.ui.input({ prompt = "PasteLine >> " }, function(input)
    -- 🟢 Restore original number mode and refresh
    vim.wo.relativenumber = original_rnu
    vim.wo.number = original_nu
    vim.cmd("redraw")

    if not input then return end
    local line_num, direction = input:match("^(%d+)([jkG])$")
    if not line_num or not direction then
      print("Invalid format. Use like 15k, 20j, or 12G.")
      return
    end

    local cur = vim.fn.line(".")
    local target

    if direction == "j" then
      target = cur + tonumber(line_num)
    elseif direction == "k" then
      target = cur - tonumber(line_num)
    elseif direction == "G" then
      target = tonumber(line_num)
    else
      return
    end

    vim.cmd(target .. "y")
    vim.cmd("put")
  end)
end, { desc = "Paste line from relative/absolute position under cursor" })