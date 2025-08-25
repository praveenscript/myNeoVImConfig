vim.api.nvim_create_user_command("LspSymbols", function()
	require("telescope.builtin").lsp_document_symbols()
end, {})
