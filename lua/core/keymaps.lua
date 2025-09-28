-- ~/.config/nvim/lua/core/keymaps.lua

local keymap = vim.keymap.set

-- Keymaps for workspace management
vim.keymap.set("n", "<leader>{", function()
  local persistence = require("persistence")
  local Path = require("plenary.path")

  local session_dir = persistence.options.dir
  local session_files = vim.fn.glob(session_dir .. "/*.json", true, true)

  local entries = {}
  for _, file in ipairs(session_files) do
    local path = Path:new(file)
    table.insert(entries, path:make_relative(session_dir))
  end

  require("fzf-lua").fzf_exec(entries, {
    prompt = "🗂️ Load Session > ",
    actions = {
      ["default"] = function(selected)
        local session_name = selected[1]
        local full_path = session_dir .. "/" .. session_name
        persistence.load({ session = full_path })
      end,
    },
  })
end, { desc = "Search workspaces (persistence.nvim)" })

-- LIve LiveServer
vim.keymap.set("n", "<leader>ls", ":!live-server .<CR>", { desc = "Start live-server" })

-- Increase/decrease right window width
vim.keymap.set("n", "<A-l>", ":vertical resize +5<CR>", { silent = true })
vim.keymap.set("n", "<A-h>", ":vertical resize -5<CR>", { silent = true })

-- Increase/decrease window height (useful for horizontal splits)
vim.keymap.set("n", "<A-k>", ":resize +5<CR>", { silent = true })
vim.keymap.set("n", "<A-j>", ":resize -5<CR>", { silent = true })

-- Toggles indent on/off
vim.keymap.set("n", "<leader>ii", "<cmd>IBLToggle<cr>", { desc = "Toggle indent guides" })

-- function wrappers
vim.keymap.set("n", "<leader>wf", function()
  local word = vim.fn.expand("<cword>")
  local func = vim.fn.input("Function: ")
  local wrapped = func .. "(" .. word .. ")"
  vim.api.nvim_set_current_line(
    vim.fn.getline("."):gsub(word, wrapped, 1)
  )
  -- Move cursor to just after the function name and open insert mode
  local col = vim.fn.col(".")
  vim.cmd("normal! 0")
  vim.cmd("normal! /" .. func .. "<CR>")
  vim.cmd("normal! f(i")
end, { noremap = true, silent = true })



