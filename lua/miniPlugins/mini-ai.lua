return {
    { 'echasnovski/mini.ai', 
    version = '*' ,
 lazy = false,  -- or true, if you'd like to load on demand
    config = function()
      require('mini.ai').setup()
    end,
},

}