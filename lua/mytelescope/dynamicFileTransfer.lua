local function dynamic_file_transfer()
	-- Step 1: Destination = current buffer's path
	local dest_dir = vim.fn.expand("%:p:h")
	dest_dir = vim.trim(dest_dir)
	vim.notify("Our destination is " .. dest_dir)
	if dest_dir == "" then
		vim.notify("Could not determine destination path", vim.log.levels.ERROR)
		return
	end

	local function copy_files(paths, target_dir)
		local loop = vim.loop
		-- Ensure is target_dir exists

		loop.fs_mkdir(target_dir, 493) -- 493 = 0755, safe default

		for _, src in ipairs(paths) do
			local filename = vim.fn.fnamemodify(src, ":t")
			-- Extracts just the file name
			local dest = target_dir .. "/" .. filename

			local src_fd = loop.fs_open(src, "r", 438)
			if (src_fd) then
				local stat = loop.fs_fstat(src_fd)
				local data = loop.fs_read(src_fd, stat.size, 0)
				loop.fs_close(src_fd)

				local dest_fd = loop.fs_open(dest, "w", 438)
				loop.fs_write(dest_fd, data, 0)
				loop.fs_close(dest_fd)

				print("✅ Copied to:", dest)
			else
				print("⚠️ Failed to open:", src)
			end
		end
	end



	-- Step 2: Prompt user for file/folder name
	local actions = require('telescope.actions')
	local action_state = require('telescope.actions.state')
	local finders = require('telescope.finders')
	local conf = require('telescope.config').values
	local scan = require("plenary.scandir")
	local pickers = require("telescope.pickers")

	local selected_file_path = nil
	local table_file_paths = nil
	-- First finds a dir where all files contains
	require('telescope.builtin').find_files({
		prompt_title = "find a file",
		-- cwd = vim.fn.expand("~"),
		cwd = "C:/Users/prave/Projects",
		attach_mappings = function(prompt_bufnr, map)
			map("i", "<cr>", function()
				local selected_entry = action_state.get_selected_entry()
				local filepath = selected_entry and selected_entry.path or selected_ent
				print("selected file path is: ", filepath)
				-- storing the file path
				selected_file_path = filepath
				vim.notify("Selected File path from telescope is" .. selected_file_path)




				if selected_entry then
					actions.close(prompt_bufnr)

					files_selector(selected_file_path)
				end
			end)
			return true
		end,
	})
	-- end of function


	-- return a bunch of file paths
	function files_selector(selected_file_path)
		local parent_dir = vim.fn.fnamemodify(selected_file_path, ":h")

		local total_files = scan.scan_dir(parent_dir, { depth = 3 }) -- you can set depth or use patterns
		print("These are the items of that path", total_files)
		local selected_files = nil
		pickers.new({}, {

			prompt_title = "Files Under that Folder",
			finder = finders.new_table {
				results = total_files,
			},
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr, map)
				map("i", "<CR>", function()
					print("Matched File Count is", #total_files)
					selected_files = total_files

					table_file_paths = selected_files
					vim.notify(selected_files)


					actions.close(prompt_bufnr)

					if selected_files then
						copy_files(table_file_paths, dest_dir)
					end
				end)
				return true
			end,


		}):find()
		print("selected files are", selected_files)
	end

	-- find files fn ends
end


vim.keymap.set("n", "<leader>tt", dynamic_file_transfer, { desc = "dynamic file transfer" })
