return {
  "abecodes/tabout.nvim",
  event = "InsertEnter",
  dependencies = { "nvim-cmp" }, -- optional, if you're using cmp
  config = function()
    require("tabout").setup({
      tabkey = "<Tab>",
      backwards_tabkey = "<S-Tab>",
      act_as_tab = true,
    })
  end,
}
