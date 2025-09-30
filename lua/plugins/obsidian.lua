return{
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  ft = "markdown",
  cmd = { "Obsidian quickswitch", "Obsidian search" },
  keys = {
    { "<leader>co", "<cmd>Obsidian quick_switch<CR>", desc = "Obsidian Quick Switch" },
    { "<leader>cs", "<cmd>Obsidian search<CR>", desc = "Obsidian Search" },
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Projects/obsidianVaults/Wisdom",
      },
    },
    legacy_commands = false,
  },
  config = function(_, opts)
    require("obsidian").setup(opts)

    -- Set conceallevel for markdown buffers
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.opt_local.conceallevel = 2
      end,
      group = vim.api.nvim_create_augroup("ObsidianConceal", { clear = true }),
    })
  end,
} 
