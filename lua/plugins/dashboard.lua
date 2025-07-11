-- lua/plugins/dashboard.lua
return {
  "goolord/alpha-nvim",
  config = function()
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

    dashboard.button("p", "🗂  Projects", ":lua require('utils.project_picker').open()<CR>")


dashboard.section.buttons.val = {
  dashboard.button("p", "🗂  Projects", ":lua require('utils.project_picker').open()<CR>"),
  dashboard.button("q", "🚪 Quit", ":qa<CR>"),
}

    dashboard.section.footer.val = { "Welcome back, Praveen 🚀" }


    alpha.setup(dashboard.config)
  end,
}
