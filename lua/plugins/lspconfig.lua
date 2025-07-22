return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      -- Install servers with Mason
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "jsonls" }, -- ✅ new server name
        automatic_installation = true,
      })

      -- Set up handlers for installed servers
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

    --   require("mason-lspconfig").setup_handlers({
    --     function(server_name)
    --       lspconfig[server_name].setup({
    --         capabilities = capabilities,
    --       })
    --     end,
    --   })
    end,
  },
}





