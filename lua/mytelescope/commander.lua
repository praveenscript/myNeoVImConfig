vim.keymap.set("n", "<leader>cc", function()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local themes = require("telescope.themes")

	local all_commands = vim.api.nvim_get_commands({})
	local entries = {}
	for name, cmd in pairs(all_commands) do
		table.insert(entries, {
			display = name,
			value = name,
			definition = cmd.definition,
		})
	end

	local theme_opts = themes.get_dropdown({
		prompt_title = "Available Commands",
		prompt_position = "top",
		layout_config = {
			height = 0.75,
			width = 0.5,
			preview_cutoff = 120,
		},
	})

	pickers
	    .new(theme_opts, {
		    finder = finders.new_table({
			    results = entries,
			    entry_maker = function(entry)
				    return {
					    value = entry.value,
					    display = entry.display,
					    ordinal = entry.display,
				    }
			    end,
		    }),
		    sorter = conf.generic_sorter({}),
		    attach_mappings = function(prompt_bufnr, _)
			    actions.select_default:replace(function()
				    local selection = action_state.get_selected_entry()
				    actions.close(prompt_bufnr)
				    vim.cmd(selection.value)
			    end)
			    return true
		    end,
	    })
	    :find()
end, { desc = "Available commands" })
