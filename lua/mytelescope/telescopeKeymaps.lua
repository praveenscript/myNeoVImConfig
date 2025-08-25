-- Telescope Fuzzy Search workspaces (VS Code style)
-- print("From Telescope Keymaps")

local kmap = vim.keymap.set

-- kmap("n", "<leader>ff", function()
-- 	require("telescope.builtin").find_files({
-- 		cwd =
-- 	})
-- end, {
-- 	desc = "Searchs all files",
-- })

local builtin = require('telescope.builtin')
kmap('n', '<leader>lg', builtin.live_grep, {
	desc = 'Live Grep'
})


kmap('n', '<leader>fb', builtin.buffers, {
	desc = 'Find Buffers'
})

kmap("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Find Recent Files" })

kmap('n', '<leader>rr', builtin.registers, {
	desc = "Find registers"
})
local extensions = require('telescope').extensions
kmap('n', '<leader>ft', function()
	extensions.notify.notify()
end, {
	desc = "Find Notifications"
})

kmap('n', '<leader>fh', builtin.help_tags, {
	desc = 'Help Tags'
})
