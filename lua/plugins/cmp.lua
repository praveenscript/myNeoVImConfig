-- return {
--   -- LuaSnip snippet engine
--   {
--     "L3MON4D3/LuaSnip",
--     version = "v2.*",
--     build = "make install_jsregexp",
--     dependencies = {
--       "rafamadriz/friendly-snippets",
--       "saadparwaiz1/cmp_luasnip",
--     },
--     config = function()
--       require("luasnip.loaders.from_vscode").lazy_load()
--     end,
--   },

--   -- nvim-cmp completion engine
--   {
--     "hrsh7th/nvim-cmp",
--     dependencies = {
--       "saadparwaiz1/cmp_luasnip",
--       "hrsh7th/cmp-buffer",
--       "hrsh7th/cmp-path",
--       "hrsh7th/cmp-nvim-lsp",
--     },
--     config = function()
--       local cmp = require("cmp")
--       local luasnip = require("luasnip")

--       cmp.setup({
--         snippet = {
--           expand = function(args)
--             luasnip.lsp_expand(args.body)
--           end,
--         },
--         mapping = cmp.mapping.preset.insert({
--           ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--           ["<C-f>"] = cmp.mapping.scroll_docs(4),
--           ["<C-Space>"] = cmp.mapping.complete(),
--           ["<C-e>"] = cmp.mapping.abort(),
--           ["<CR>"] = cmp.mapping.confirm({ select = true }),
--           ["<Tab>"] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--               cmp.select_next_item()
--             elseif luasnip.expand_or_jumpable() then
--               luasnip.expand_or_jump()
--             else
--               fallback()
--             end
--           end, { "i", "s" }),
--           ["<S-Tab>"] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--               cmp.select_prev_item()
--             elseif luasnip.jumpable(-1) then
--               luasnip.jump(-1)
--             else
--               fallback()
--             end
--           end, { "i", "s" }),
--         }),
--         sources = cmp.config.sources({
--           { name = "nvim_lsp" },
--           { name = "luasnip" }, -- This is crucial for snippets to appear
--           { name = "buffer" },
--           { name = "path" },
--         }),
--       })
--     end,
--   },
-- }


return {
  {
    "saghen/blink.cmp",
    lazy = false,
    version = "1.*",
    event = { "InsertEnter" },
    build = "cargo build --release",
    opts = {
      snippets = { preset = "luasnip", 
    expand = function(snippet)
    require("luasnip").lsp_expand(snippet)
    end,
  
  active = function(filter)
  if filter and filter.direction then
    return require("luasnip").jumpable(filter.direction)
  end
  return require("luasnip").in_snippet()
end,
jump = function(direction)
  require("luasnip").jump(direction)
  end,
}, -- delegates expansion to LuaSnip
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      keymap ={
      preset = "enter",
      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },

      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
    }, 
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true },
      appearance = {
        nerd_font_variant = "mono",
      },
    },
  },
}