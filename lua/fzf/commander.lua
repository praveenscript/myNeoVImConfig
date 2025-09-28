vim.keymap.set("n", "<leader>cc", function()
  local fzf = require("fzf-lua")

  local all_commands = vim.api.nvim_get_commands({})
  local entries = {}

  for name, cmd in pairs(all_commands) do
    table.insert(entries, {
      text = name,
      cmd = cmd.definition or "",
    })
  end

  fzf.fzf_exec(vim.tbl_map(function(entry)
    return entry.text
  end, entries), {
    prompt = "Available Commands > ",
    previewer = "builtin",
    winopts = {
      height = 0.75,
      width = 0.5,
      preview = {
        layout = "vertical",
        vertical = "up:50%",
      },
    },
    actions = {
      ["default"] = function(selected)
        local cmd = selected[1]
        vim.cmd(cmd)
      end,
    },
    preview = function(entry)
      local match = vim.tbl_filter(function(e)
        return e.text == entry
      end, entries)[1]
      return match and match.cmd or "No definition available"
    end,
  })
end, { desc = "Available commands" })