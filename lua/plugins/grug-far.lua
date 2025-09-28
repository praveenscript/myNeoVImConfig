return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({})

    local grug = require("grug-far")

    -- 🌍 Global Actions (launchers)
    vim.keymap.set("n", "<leader>gr", grug.open, { desc = "Grug-FAR: Find & Replace" })
    vim.keymap.set("n", "<leader>gw", function()
      grug.open({ prefills = { search = vim.fn.expand("<cword>") } })
    end, { desc = "Grug-FAR: Search word under cursor" })
    vim.keymap.set("n", "<leader>gf", function()
      grug.open({ prefills = { paths = vim.fn.expand("%") } })
    end, { desc = "Grug-FAR: Search in current file" })
    vim.keymap.set("v", "<leader>gs", grug.open_within, { desc = "Grug-FAR: Search in selection" })

    -- 📦 Buffer-Local Actions (inside Grug-FAR UI)
    vim.keymap.set("n", "<localleader>r", grug.replace, { desc = "Grug-FAR: Replace all" })
    vim.keymap.set("n", "<localleader>s", grug.sync_edits, { desc = "Grug-FAR: Sync edits" })
    vim.keymap.set("n", "<localleader>j", grug.jump_to_match, { desc = "Grug-FAR: Jump to match" })
    vim.keymap.set("n", "<localleader>p", grug.toggle_preview, { desc = "Grug-FAR: Toggle preview" })
  end,
}
