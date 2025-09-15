return {
  'bloznelis/before.nvim',
  config = function()
    require('before').setup({
      history_size = 42,            -- Number of edit locations to track
      history_wrap_enabled = true, -- Optional: wrap around history
    })

    local before = require('before')

    -- 🔁 Cycle through edits
    vim.keymap.set('n', '<C-h>', before.jump_to_last_edit, {})
    vim.keymap.set('n', '<C-l>', before.jump_to_next_edit, {})

    -- 🔍 Telescope picker (if you use Telescope)
    vim.keymap.set('n', '<leader>oe', function()
      before.show_edits_in_telescope(require('telescope.themes').get_dropdown())
    end)

    -- 📋 Quickfix list (alternative to Telescope)
    vim.keymap.set('n', '<leader>oq', before.show_edits_in_quickfix, {})
  end
}