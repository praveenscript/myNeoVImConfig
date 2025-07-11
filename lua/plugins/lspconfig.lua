-- lua/plugins/lsp.lua
return {{
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
        require("mason").setup()
    end
}, {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {"williamboman/mason.nvim", "neovim/nvim-lspconfig"},
    config = function()
        -- Ensure servers are installed
        require("mason-lspconfig").setup({
            ensure_installed = {"ts_ls", "pyright"}
        })

        -- Setup each LSP server manually
        local lspconfig = require("lspconfig")

        local capabilities = require("cmp_nvim_lsp").default_capabilities()


        lspconfig.ts_ls.setup({
          capabilities = capabilities

        }) -- JavaScript + TypeScript
        lspconfig.pyright.setup({ -- Python
            capabilities = capabilities
        })

    end
}}
