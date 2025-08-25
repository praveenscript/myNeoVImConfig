return {
	{
		'echasnovski/mini.ai',
		version = '*',
		lazy = false, -- or true, if you'd like to load on demand
		config = function()
			require('mini.ai').setup({

				custom_textobjects = {
					c = require('mini.ai').gen_spec.treesitter({
						a = { '@call_expression' },
						i = { '@arguments' },
					}, {}),
				},

			})
			require('miniPlugins.mini-KeyBindings')
		end,
	},

}

