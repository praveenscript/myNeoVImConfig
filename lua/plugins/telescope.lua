-- ~/.config/nvim/lua/plugins/telescope.lua
return {
    "nvim-telescope/telescope.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        require('telescope').setup({
            -- Telescope configuration here

            defaults = {
                mappings = {
                    i = {
                        ["<C-c>"] = require("telescope.actions").close,
                        ["<C-q>"] = require("telescope.actions").close
                    },
                    n = {
                        ["q"] = require("telescope.actions").close
                    }
                }
            }

        })

        -- Add keymaps specific to telescope
        local builtin = require('telescope.builtin')
        -- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })

        -- vim.keymap.set("n", "<leader>bf", function()
        --     require("telescope").extensions.file_browser.file_browser({
        --         path = vim.fn.expand("%:p:h"),
        --         select_buffer = true
        --     })
        -- end, {
        --     desc = "Open File Browser"
        -- })

        vim.keymap.set('n', '<leader>ff', function()
            require('telescope.builtin').find_files({
                cwd = vim.fn.expand('%:p:h') -- buffer's directory
            })
        end, {
            desc = 'Find Files in Buffer Dir'
        })

        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {
            desc = 'Live Grep'
        })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {
            desc = 'Find Buffers'
        })
        -- vim.keymap.set("n", "<leader>bb", ":Telescope buffers<CR>", { desc = "Switch buffer" })

        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {
            desc = 'Help Tags'
        })
    end
}
