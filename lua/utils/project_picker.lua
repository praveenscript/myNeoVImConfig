-- lua/utils/project_picker.lua
local finder = require("utils.project_finder")

local M = {}

function M.open()
  local projects = finder.get_projects()
  if #projects == 0 then
    vim.notify("No projects found!", vim.log.levels.WARN)
    return
  end

  -- Open a new scratch buffer
  vim.cmd("enew")
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "wipe"
  vim.bo.swapfile = false
  vim.api.nvim_buf_set_option(0, "modifiable", true)

  -- Title
  local lines = { "📁 Your Projects:", "-------------------" }

--   for i, path in ipairs(projects) do
--     local name = vim.fn.fnamemodify(path, ":t")
--     table.insert(lines, string.format("[%d] %s", i, name))
--   end

  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)

-- Set keybindings to select projects
for i, path in ipairs(projects) do
  local key = tostring(i)
  local name = vim.fn.fnamemodify(path, ":t")
  vim.api.nvim_buf_set_lines(0, -1, -1, false, {
    string.format("📁 [%d] %s", i, name)
  })

  vim.keymap.set("n", key, function()
    vim.cmd("cd " .. path)
    require("telescope.builtin").find_files({ cwd = path })
  end, { buffer = 0, desc = "Browse files in " .. name })
end



end

return M