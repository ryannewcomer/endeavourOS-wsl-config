return {
  "gbprod/yanky.nvim",
  version = "*",
  lazy = false,
  keys = {
    { "<leader>v", "<cmd>YankyCycleForward<cr>", desc == "yanky cycle forward" },
    { "<leader>c", "<cmd>YankyCycleBackward<cr>", desc == "yanky cycle backward" },
  },
  config = function ()
    require('yanky').setup {}
  end,
}
