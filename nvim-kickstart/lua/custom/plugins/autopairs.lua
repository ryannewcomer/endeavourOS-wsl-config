return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  lazy = false,
  opts = {},
  config = function ()
   require("nvim-autopairs").setup {
      disable_filetype = { "TelescopePrompt", "vim" }
    }
  end,
  "windwp/nvim-ts-autotag",
  lazy = false,
  config = function ()
   require('nvim-ts-autotag').setup() 
  end
}
