-- lua/utils/project_finder.lua
local uv = vim.loop
local M = {}

-- Modify this to your actual projects root
local PROJECTS_DIR = "C:/Users/prave/Projects"
local MAX_DEPTH = 6

local ignore = {
  ["node_modules"] = true,
  [".git"] = true,
  ["dist"] = true,
  ["venv"] = true,
  ["__pycache__"] = true,
}

local function is_git_repo(path)
  local handle = uv.fs_scandir(path)
  if not handle then return false end

  while true do
    local name, typ = uv.fs_scandir_next(handle)
    if not name then break end
    if name == ".git" and typ == "directory" then
      return true
    end
  end

  return false
end

local function scan_dir(base, depth, results)
  if depth > MAX_DEPTH then return end

  local handle = uv.fs_scandir(base)
  if not handle then return end

  while true do
    local name, typ = uv.fs_scandir_next(handle)
    if not name then break end

    if typ == "directory" and not ignore[name] then
      local full = base .. "/" .. name

      if is_git_repo(full) then
        table.insert(results, full)
      else
        scan_dir(full, depth + 1, results)
      end
    end
  end
end

function M.get_projects()
  local projects = {}
  local expanded = vim.fn.expand(PROJECTS_DIR)

  scan_dir(expanded, 1, projects)
  return projects
end

return M