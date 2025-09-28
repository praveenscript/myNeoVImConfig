local kmap = vim.keymap.set

-- 🔍 Live Grep
kmap("n", "<leader>lg", function()
  require("fzf-lua").live_grep()
end, { desc = "Live Grep" })

-- 📁 Find Buffers
kmap("n", "<leader>fb", function()
  require("fzf-lua").buffers()
end, { desc = "Find Buffers" })

-- 🕘 Find Recent Files
kmap("n", "<leader>fr", function()
  require("fzf-lua").oldfiles()
end, { desc = "Find Recent Files" })

-- 📋 Find Registers
kmap("n", "<leader>rr", function()
  require("fzf-lua").registers()
end, { desc = "Find Registers" })

-- 🧠 Help Tags
kmap("n", "<leader>fh", function()
  require("fzf-lua").help_tags()
end, { desc = "Help Tags" })

-- 🔔 Find Notifications (requires notify extension)
kmap("n", "<leader>ft", function()
  require("fzf-lua").extensions.notify.notify()
end, { desc = "Find Notifications" })

