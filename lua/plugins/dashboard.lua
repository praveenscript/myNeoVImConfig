-- lua/plugins/dashboard.lua
return {
  "goolord/alpha-nvim",
  config = function()
local find_config = require("utils.findConfig")
local config_path = find_config.get_config_path()

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local finder = require("utils.project_finder")

dashboard.section.header.val = {
  [[     )))]],
  [[    (((]],
  [[  +-----+]],
  [[  |     |}]],
  [[  `-----'    ]],
  [[___________]],
  [[`---------']],
}

-- 💡 Initialize button list before inserting anything
local buttons = {
  dashboard.button("p", "🗂  Projects", ":lua require('utils.project_picker').open()<CR>"),
  dashboard.button("q", "🚪 Quit", ":qa<CR>"),
}

-- ➕ Conditionally add the config button
if config_path then
  table.insert(buttons, dashboard.button("c", "  Config", ":edit " .. config_path .. "<CR>"))
else
  table.insert(buttons, dashboard.button("c", "  Config", ":echo 'Config not found'<CR>"))
end

-- ✅ Apply the button list
dashboard.section.buttons.val = buttons

dashboard.section.footer.val = { "Welcome back, Praveen 🚀" }

alpha.setup(dashboard.config)

  end,
}
