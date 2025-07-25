-- Telescope to open splits
vim.keymap.set("n", "<leader>sh", function() SplitWithBufferPicker("horizontal") end,
  { desc = "Split Horizontally with Buffer Picker" })
vim.keymap.set("n", "<leader>sv", function() SplitWithBufferPicker("vertical") end,
  { desc = "Split Vertically with Buffer Picker" })
local builtin = require("telescope.builtin")

function SplitWithBufferPicker(direction)
  local action = (direction == "horizontal") and ":split " or ":vsplit "
  builtin.buffers {
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local selection = require("telescope.actions.state").get_selected_entry()
        require("telescope.actions").close(prompt_bufnr)
        vim.cmd(action .. selection.filename)
      end)
      return true
    end
  }
end
