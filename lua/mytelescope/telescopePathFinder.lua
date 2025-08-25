local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")
local Path = require("plenary.path")

local M = {}

M.path_finder = function(opts)
  opts = opts or {}

  pickers.new(opts, {
    prompt_title = "Copy File Path",
    finder = finders.new_oneshot_job(
      { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
      opts
    ),
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(_, map)
      map("i", "<CR>", function()
        local entry = action_state.get_selected_entry()
        if entry then
          local file_path = Path:new(entry.path):absolute()
          vim.fn.setreg("+", file_path)  -- copies to system clipboard
          print("📋 Copied to clipboard:\n" .. file_path)
        end
        actions.close()
      end)
      return true
    end,
  }):find()
end

return M
