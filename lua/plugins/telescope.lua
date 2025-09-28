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
				}
			},
			-- Telescope configuration here
			-- Add keymaps specific to telescope
			-- Loading Telescope Custom Made features
			require('telescope').load_extension('fzf'),
			require('mytelescope.splits'),

			-- Telescope some extra shit I've made up
			require('lua.fzf.telescopePaste'),
			require('mytelescope.DynamicFileTransfer'),
			require('lua.fzf.fzf-keymaps'),
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
				},
				file_ignore_patterns = {
					"node_modules",
					".git",
					"%.lock", -- ignore lock files like package-lock.json
					"%.lnk", -- ignore Windows shortcuts
					"%.DS_Store", -- macOS clutter
					"__pycache__",
					"%.exe", -- optional, exclude binaries
					"%.dll", -- optional, Windows binaries
					"%.class", -- optional, compiled Java classes
				},
				no_ignore = true,
				hidden = true,

			}




		}

		)
	end
}
