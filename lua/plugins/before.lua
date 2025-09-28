return {
  'bloznelis/before.nvim',
  config = function()
    require('before').setup({
      history_size = 42,            -- Number of edit locations to track
      history_wrap_enabled = true,  -- Optional: wrap around history
    })

    local before = require('before')
    local fzf = require('fzf-lua')  -- Add fzf-lua require

    -- 🔁 Cycle through edits
    vim.keymap.set('n', '<C-h>', before.jump_to_last_edit, {})
    vim.keymap.set('n', '<C-l>', before.jump_to_next_edit, {})

    -- 🔍 Show edits in Fzf-lua
    vim.keymap.set('n', '<leader>oe', function()
      local edits = before.get_edits() or {}
      local entries = {}

      for _, edit in ipairs(edits) do
        -- each edit has `filename` and `lnum` fields
        table.insert(entries, {
          text = string.format('%s:%d', edit.filename, edit.lnum),
          lnum = edit.lnum,
          filename = edit.filename
        })
      end

      fzf.fzf_exec(function(cb)
        for _, e in ipairs(entries) do
          cb(e.text)
        end
        cb()
      end, {
        prompt = 'Edits> ',
        actions = {
          ['default'] = function(selected)
            local choice = selected[1]
            if choice then
              local file, lnum = choice:match('^(.*):(%d+)$')
              vim.cmd('edit ' .. file)
              vim.api.nvim_win_set_cursor(0, { tonumber(lnum), 0 })
            end
          end
        }
      })
    end)

    -- 📋 Quickfix list (already Telescope-free)
    vim.keymap.set('n', '<leader>oq', before.show_edits_in_quickfix, {})
  end
}
