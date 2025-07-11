-- plugins/session.lua
return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      log_level = "error",
      auto_session_enabled = true,
      auto_save_enabled = true,
      auto_restore_enabled = true,  -- Auto-load last session on startup
      session_lens = {              -- Telescope integration
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
          -- Add the keymap here
    vim.keymap.set("n", "<leader>{", "<cmd>Telescope session-lens search_session<CR>", {
      desc = "Search workspaces (VS Code style)"
    })
    })
  end
}