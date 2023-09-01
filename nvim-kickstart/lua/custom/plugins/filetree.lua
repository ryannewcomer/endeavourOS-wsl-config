vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  keys = {
  { "<leader>e", "<cmd>NvimTreeOpen<cr>", desc == "nvim-Tree"},
  { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc == "toggle-nvim-Tree"},
  },
  config = function ()
    require('nvim-tree').setup {}
  end,
}
