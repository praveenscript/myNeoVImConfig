local function paste_from_line_picker()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local entries = {}
  for i, line in ipairs(lines) do
    table.insert(entries, string.format("%4d│ %s", i, line))
  end

  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values

  pickers.new({}, {
    prompt_title = "📄 Paste Line from Buffer",
    finder = finders.new_table({
      results = entries,
      entry_maker = function(entry)
  local line_num_str = entry:match("^(%d+)")
  local line_num = tonumber(line_num_str)
  if not line_num then return nil end -- guard

  return {
    value = line_num,
    display = entry,
    ordinal = entry,
  }
end
,
    }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      map("i", "<CR>", function()
        local entry = action_state.get_selected_entry()
        local content = vim.api.nvim_buf_get_lines(0, entry.value - 1, entry.value, false)
        vim.api.nvim_put(content, "l", true, true)
        actions.close(prompt_bufnr)
      end)
      return true
    end,
  }):find()
end

vim.keymap.set("n", "<leader>flp", paste_from_line_picker, { desc = "📎 Paste line from fuzzy picker" })