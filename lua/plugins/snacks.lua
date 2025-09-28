return {
        "folke/snacks.nvim",
        opts = {
                notifier = { enabled = true },
                image = { enabled = true },
                bigfile = { enabled = true },
                explorer = { enabled = false },
                indent = { enabled = true },
                input = { enabled = true },
                quickfile = { enabled = true },
                statuscolumn = { enabled = false },

                words = { enabled = false },
                rename = { enabled = false },
                zen = { enabled = false },
                dashboard = {
                        enabled = true,


                },
                animate = {
                        --   ---@type snacks.animate.Duration|number
                        --   duration = 20, -- ms per step
                        --   easing = "linear",
                        --   fps = 60, -- frames per second. Global setting for all animations
                },

                picker = {

                        enabled = true,
                }
        },
}
