-- ~/.config/nvim/lua/plugins/init.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- List your plugins here, or require separate files
  { import = "plugins.telescope" },
  { import = "plugins.treesitter" },
  -- Add other plugins...
  { import = "plugins.session" },
  { import = "plugins.oil" },
  -- { import = "plugins.catppuccin"},
  { import = "dashboard.dashboard" },
  { import = "plugins.lspconfig" },
  { import = "plugins.comment" },
  { import = "plugins.webdevicons" },
  { import = "plugins.rosepinemoon" },
  { import = "plugins.toggleterm" },
  { import = "plugins.cmp" },
  { import = "plugins.rainbow" },
  { import = "plugins.autoclose" },
  { import = "plugins.tabout" },
  { import = "plugins.miniMove" },
  { import = "plugins.neogit" },
  { import = "plugins.lualine" },
  { import = "plugins.treesitter-textObjects" },
  { import = "plugins.bufferline" },
  { import = "plugins.mini-line"},
  -- { import = "plugins.helpers_plugin"}
  {import = "plugins.indent-blankline"},
  {import = "plugins.diffview"}
})

-- color Scheme catppuccin
-- vim.cmd.colorscheme("catppuccin-mocha") -- or "catppuccin-mocha", "catppuccin-frappe", etc.
