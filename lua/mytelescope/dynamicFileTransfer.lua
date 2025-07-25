local function dynamic_file_transfer()
  -- Step 1: Destination = current buffer's path
  local dest_dir = vim.fn.expand("%:p:h")
  if dest_dir == "" then
    vim.notify("Could not determine destination path", vim.log.levels.ERROR)
    return
  end

  -- Step 2: Prompt user for file/folder name
  local input = vim.fn.input("🔍 Search file or folder: ")
  if input == "" then
    vim.notify("No input provided", vim.log.levels.WARN)
    return
  end

  -- Step 3: Use fd to find matches across system
  local results = vim.fn.systemlist({ "fd", input, "--type", "f", "--type", "d", "--hidden" })
  if vim.tbl_isempty(results) then
    vim.notify("No matches found for: " .. input, vim.log.levels.WARN)
    return
  end

  -- Step 4: Present first match in file browser
  for _, path in ipairs(results) do
    local stat = vim.loop.fs_stat(path)
    if stat and stat.type == "directory" then
      require("telescope").extensions.file_browser.file_browser({
        path = path,
        select_buffer = true,
        attach_mappings = function(_, map)
          map("i", "<CR>", function(prompt_bufnr)
            local fb_utils = require("telescope._extensions.file_browser.utils")
            local selected_files = fb_utils.get_selected_files(prompt_bufnr)
            for _, source_path in ipairs(selected_files) do
              local filename = vim.fn.fnamemodify(source_path, ":t")
              local target_path = dest_dir .. "/" .. filename
              vim.fn.system({ "cp", source_path, target_path })
              vim.notify("📁 Copied: " .. filename .. " ➜ " .. target_path, vim.log.levels.INFO)
            end
            require("telescope.actions").close(prompt_bufnr)
          end)
          return true
        end,
      })
      return
    elseif stat and stat.type == "file" then
      local parent = vim.fn.fnamemodify(path, ":h")
      require("telescope").extensions.file_browser.file_browser({
        path = parent,
        select_buffer = true,
        attach_mappings = function(_, map)
          map("i", "<CR>", function(prompt_bufnr)
            local fb_utils = require("telescope._extensions.file_browser.utils")
            local selected_files = fb_utils.get_selected_files(prompt_bufnr)
            for _, source_path in ipairs(selected_files) do
              local filename = vim.fn.fnamemodify(source_path, ":t")
              local target_path = dest_dir .. "/" .. filename
              vim.fn.system({ "cp", source_path, target_path })
              vim.notify("📁 Copied: " .. filename .. " ➜ " .. target_path, vim.log.levels.INFO)
            end
            require("telescope.actions").close(prompt_bufnr)
          end)
          return true
        end,
      })
      return
    end
  end
end

-- Optional Keymap
-- vim.keymap.set("n", "<leader>ft", smart_file_transfer, { desc = "Smart Transfer by Name" })

-- Optional keymap suggestion: <leader>tt for "Telescope Transfer"
vim.keymap.set("n", "<leader>tt", dynamic_file_transfer, { desc = "Dynamic File Transfer" })
