-- Termux has a problem with pasting it tries to paste with formatting and it's ends up being shitty; so direct paste is used
local is_termux = vim.g.is_termux

vim.keymap.set("n", "<leader>p", function()
	if is_termux then
		vim.opt.paste = true
	end
	vim.cmd('normal "+p') -- paste from system clipboard
	if is_termux then
		vim.opt.paste = false
	end
end, { desc = "Smart paste (Termux-aware)" })
