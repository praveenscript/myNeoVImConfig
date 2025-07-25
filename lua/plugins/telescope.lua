-- ~/.config/nvim/lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require('telescope').setup({
    extension = {
				fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case"
			} },
    -- Telescope configuration here
    -- Add keymaps specific to telescope
    -- Loading Telescope Custom Made features
    require('telescope').load_extension('fzf'),
    require('mytelescope.splits'),

    -- Telescope Speed Paster Picker
    require('mytelescope.telescopePaste'),
    require('mytelescope.DynamicFileTransfer'),
    require('mytelescope.telescopeKeymaps'),
    require('mytelescope.findFiles'),
      defaults = {
        mappings = {
          i = {
            ["<C-c>"] = require("telescope.actions").close,
            ["<C-q>"] = require("telescope.actions").close
          },
          n = {
            ["q"] = require("telescope.actions").close
          }
        }
      }

    })


  end
}
