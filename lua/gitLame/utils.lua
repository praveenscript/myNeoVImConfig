local M = {}

M.get_git_root = function()
  local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  return root ~= "" and root or nil
end

M.get_relative_file_path = function(git_root)
  local full_path = vim.fn.expand("%:p")
  return full_path:sub(#git_root + 2)
end

M.get_other_branches = function()
  local current = vim.fn.systemlist("git branch --show-current")[1]
  local all = vim.fn.systemlist("git branch --format='%(refname:short)'")
  return vim.tbl_filter(function(b) return b ~= current end, all)
end

M.run_git_command = function(cmd_name)
  local ok, err = pcall(function()
    vim.cmd(cmd_name)
  end)

  if not ok then
    vim.notify("Failed to run command: " .. cmd_name .. "\n" .. err, vim.log.levels.ERROR)
  end
end

M.get_current_filename = function (full_path)
  if full_path == "" then return "[No Name]" end
  return full_path:match("^.+/(.+)$") or full_path
end




return M