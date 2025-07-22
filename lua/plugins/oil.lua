return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- icon support
  lazy = false, -- recommended to keep eager
  opts = {
    view_options = {
      show_hidden = true, -- ✨ show dotfiles like .env, .gitignore etc.
    },
  },
    config = function()
      require('myoil.replaceBuffer')
    end,

}