-- stash_peek.lua
local M = {}

-- Utility to run shell commands
local function shell(cmd)
	local handle = io.popen(cmd)
	local result = handle:read("*a")
	handle:close()
	return result
end

-- Parse stash list into table
local function get_stash_list()
	local raw = shell("git stash list")
	local stashes = {}
	for line in raw:gmatch("[^\r\n]+") do
		local id, title = line:match("^(stash@%{%d+%})%s*:%s*(.+)$")
		if id and title then
			table.insert(stashes, { id = id, title = title })
		end
	end
	return stashes
end

-- Prompt user to select stash
local function select_stash(stashes)
	-- Create scratch buffer
	vim.cmd("new")
	vim.bo.buftype = "nofile"
	vim.bo.bufhidden = "wipe"
	vim.bo.swapfile = false
	vim.bo.filetype = "stashlist"
	vim.cmd("setlocal nobuflisted")

	-- Fill buffer with stash info
	local lines = {}
	for i, stash in ipairs(stashes) do
		table.insert(lines, string.format("%d. %s", i, stash.title or "Untitled"))
		table.insert(lines, string.format("   %s", stash.description or ""))
		table.insert(lines, "") -- Spacer
	end
	vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)

	-- Move cursor to top
	vim.api.nvim_win_set_cursor(0, { 1, 0 })

	-- Prompt for selection
	local choice = tonumber(vim.fn.input("Select stash number: "))
	vim.cmd("bd!") -- Close buffer

	if choice and stashes[choice] then
		return stashes[choice]
	else
		print("Invalid choice.")
		return nil
	end
end
local function parse_diff_lines(raw_lines, mode)
  local lines, signs = {}, {}

  for _, line in ipairs(raw_lines) do
    local prefix = line:sub(1, 1)
    local content = line:sub(2)

    if mode == "add" and prefix ~= "+" then goto continue end
    if mode == "del" and prefix ~= "-" then goto continue end
    if prefix ~= "+" and prefix ~= "-" then goto continue end

    table.insert(lines, content)
    signs[#lines] = prefix

    ::continue::
  end

  return lines, signs
end

local function render_gutter_signs(buf, signs)
  local ns = vim.api.nvim_create_namespace("stash_gutter")

  for lnum, sign in pairs(signs) do
    local hl = sign == "+" and "DiffAdd"
            or sign == "-" and "DiffDelete"
            or "Comment"  -- neutral

    vim.api.nvim_buf_set_extmark(buf, ns, lnum - 1, 0, {
      virt_text = { { sign, hl } },
      virt_text_pos = "overlay",
    })
  end
end


local function get_buf_basename(buf)
  local full_name = vim.api.nvim_buf_get_name(buf)
  return full_name:match("[^/\\]+$") or full_name
end

-- Open stash diff in scratch buffer
local function open_stash_diff(stash_id, mode)
  local bufname = "stash-diff-" .. stash_id
  local diff = shell("git stash show -p " .. stash_id)
  local raw_lines = vim.split(diff, "\n")
  local lines, signs = parse_diff_lines(raw_lines, mode or "all")

  -- Delete existing buffer if it exists
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if get_buf_basename(buf) == bufname then
      vim.api.nvim_buf_delete(buf, { force = true })
      print("Previous buffer is deleted")
      break
    end
  end

  -- Create fresh buffer
  local buf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_buf_set_name(buf, bufname)
  vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
  vim.api.nvim_buf_set_option(buf, "bufhidden", "hide")
  vim.api.nvim_buf_set_option(buf, "swapfile", false)
  vim.api.nvim_buf_set_option(buf, "filetype", "diff")
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Render signs
  local ns = vim.api.nvim_create_namespace("stash_gutter")
  render_gutter_signs(buf, signs)

  -- Lock buffer and show
  vim.api.nvim_buf_set_option(buf, "modifiable", false)
  vim.api.nvim_set_current_buf(buf)
end

-- Main command
function M.peek()
	local stashes = get_stash_list()
	if #stashes == 0 then
		print("No stashes found.")
		return
	end
	local selected = select_stash(stashes)
	if selected then
		open_stash_diff(selected.id)
	end
end

-- Register command
vim.api.nvim_create_user_command("StashPeek", M.peek, {})


vim.api.nvim_create_user_command("StashDiff", function(opts)
  open_stash_diff("stash@{0}", opts.args)
end, {
  nargs = "?",
  complete = function(_, _)
    return { "add", "del", "all" }
  end,
})

return M

