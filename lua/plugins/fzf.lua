return {
  
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "nvim-mini/mini.icons" },
    opts = {},
    keys = {
      {
        "<leader>ff",
        function() require("fzf-lua").files() end,
        desc = "Find Files in current working directory"
      },

      {
        "<leader>fg",
        function() require("fzf-lua").live_grep() end,
        desc = "Find by grep in Project directory"
      }
    }
}

