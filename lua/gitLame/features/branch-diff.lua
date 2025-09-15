local registry = require("gitLame.registry")
local utils = require("gitLame.utils")
local display = require("gitLame.display")

local M = {}

M.run = function()
  -- your branch diff logic here
  local git_root = utils.get_git_root()
  if not git_root then
    vim.nofity("Not Inside a Git Repo")
    return
  end

  local file_path = utils.get_relative_file_path(git_root)
  local branches = utils.get_other_branches()

  local results = {} 

  for _, branch in ipairs(branches) do
    local cmd = string.format("git diff %s...HEAD -- %s", branch, file_path)
    local diff = vim.fn.systemlist(cmd)
    if #diff > 0 then
      table.insert(results, string.format("🔍 %s has changes", branch, file_path))
    end
  end

  if #results == 0 then
    table.insert(results, "✅ No diffs found in other branches.")
  end

  display.show(results, { title = "Branch Diff: Finds selected files difference in another branches" })


end

vim.api.nvim_create_user_command("GitBranchDiff", function()
  M.run()
end, {
  desc = "Finds the current file diff against other branches",
})




return M
