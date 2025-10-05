local selected_picker = "fzf"
-- 🔍 Live Grep
vim.keymap.set("n", "<leader>lg", function()
  require("fzf-lua").live_grep()
end, { desc = "Live Grep" })


vim.keymap.set("n", "<leader>lg", function()
  require("snacks.picker").grep()
end, { desc = "Live Grep" })
-- 📁 Find Buffers
vim.keymap.set("n", "<leader>fb", function()
  require("fzf-lua").buffers()
end, { desc = "Find Buffers" })

-- 🕘 Find Recent Files
vim.keymap.set("n", "<leader>fr", function()
  require("fzf-lua").oldfiles()
end, { desc = "Find Recent Files" })

-- 📋 Find Registers
vim.keymap.set("n", "<leader>rr", function()
  require("fzf-lua").registers()
end, { desc = "Find Registers" })

-- 🧠 Help Tags
vim.keymap.set("n", "<leader>fh", function()
  require("fzf-lua").help_tags()
end, { desc = "Help Tags" })

-- Assuming snacks.nvim is already loaded and configured
vim.keymap.set("n", "<Space><Space>", function()
  require("snacks.picker").smart()
end, { desc = "Snacks Smart Picker" })

vim.keymap.set("n", "<leader>ft", function()
  require("snacks.picker").notifications()
end, { desc = "Snacks: Notification History" })

vim.keymap.set("n", "<leader>fc", function()
require("snacks.picker").command_history()
end, { desc = "Command History"})

vim.keymap.set("n", "<leader>lg", function()
require("snacks.picker").grep_word()
end, { desc = "Grep the selected word"})

vim.keymap.set("n", "<leader>lb", function()
require("snacks.picker").grep_buffer()
end, { desc = "Grep from buffers"})

vim.keymap.set("n", "<leader>ch", function ()
  require("snacks.picker").cliphist()
  
end)

vim.keymap.set("n", "<leader>gt", function ()
  require("snacks.picker").git_stash()
  
end)

-- all below


vim.keymap.set("n", "<leader>sp", function()
  local ok, snacks = pcall(require, "snacks")
  if not ok then
    vim.notify("Snacks.nvim is not loaded", vim.log.levels.ERROR)
    return
  end

  local all_pickers = {
    { label = "📋 Clipboard History", fn = snacks.picker.cliphist },
    { label = "🔍 Grep", fn = snacks.picker.grep },
    { label = "🔎 Grep Word", fn = snacks.picker.grep_word },
    { label = "📂 Grep Buffers", fn = snacks.picker.grep_buffers },
    { label = "🧭 Jumps", fn = snacks.picker.jumps },
    { label = "🕑 Recent Files", fn = snacks.picker.recent_files },
    { label = "🧠 Ghostnote", fn = snacks.picker.ghostnote },
    { label = "🧵 Snippets", fn = snacks.picker.snippets },
    { label = "📦 Registers", fn = snacks.picker.registers },
    { label = "🗂️ Buffers", fn = snacks.picker.buffers },
    { label = "📄 Files", fn = snacks.picker.files },
    { label = "📁 Filetypes", fn = snacks.picker.filetypes },
    { label = "📌 Marks", fn = snacks.picker.marks },
    { label = "🧩 Plugins", fn = snacks.picker.plugins },
    { label = "📜 Commands", fn = snacks.picker.commands },
    { label = "🧪 Autocmds", fn = snacks.picker.autocmds },
    { label = "🔧 Options", fn = snacks.picker.options },
    { label = "🎨 Highlights", fn = snacks.picker.highlights },
    { label = "🧬 Treesitter", fn = snacks.picker.treesitter },
    { label = "🧱 Syntax", fn = snacks.picker.syntax },
    { label = "🧭 Keymaps", fn = snacks.picker.keymaps },
    { label = "🧭 Keymaps (Normal)", fn = snacks.picker.keymaps_normal },
    { label = "🧭 Keymaps (Insert)", fn = snacks.picker.keymaps_insert },
    { label = "🧭 Keymaps (Visual)", fn = snacks.picker.keymaps_visual },
    { label = "🧭 Keymaps (Select)", fn = snacks.picker.keymaps_select },
    { label = "🧭 Keymaps (Command)", fn = snacks.picker.keymaps_cmdline },
    { label = "🧭 Keymaps (Terminal)", fn = snacks.picker.keymaps_terminal },
    { label = "🧭 Keymaps (Operator)", fn = snacks.picker.keymaps_operator },
    { label = "🧭 Keymaps (Lang)", fn = snacks.picker.keymaps_lang },
    { label = "🧭 Keymaps (All)", fn = snacks.picker.keymaps_all },
    { label = "🧠 LSP Symbols", fn = snacks.picker.lsp_document_symbols },
    { label = "🧠 LSP Workspace Symbols", fn = snacks.picker.lsp_workspace_symbols },
    { label = "🧠 LSP Diagnostics", fn = snacks.picker.lsp_diagnostics },
    { label = "🧠 LSP References", fn = snacks.picker.lsp_references },
    { label = "🧠 LSP Definitions", fn = snacks.picker.lsp_definitions },
    { label = "🧠 LSP Type Definitions", fn = snacks.picker.lsp_type_definitions },
    { label = "🧠 LSP Implementations", fn = snacks.picker.lsp_implementations },
    { label = "🧠 LSP Incoming Calls", fn = snacks.picker.lsp_incoming_calls },
    { label = "🧠 LSP Outgoing Calls", fn = snacks.picker.lsp_outgoing_calls },
  }

  snacks.select(all_pickers, {
    prompt = "Snacks Pickers",
    format_item = function(item) return item.label end,
    on_select = function(item) item.fn() end,
  })
end, { desc = "Snacks: All Pickers" })