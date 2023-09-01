return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  config = function()
    require("nvim-tree").setup({
      filters = {
        dofiles = false,
      },
      float = {
        enable = true,
        open_win_config = {
          border = "rounded",
        },
      },
    })
  end,

  { "nvim-neo-tree/neo-tree.nvim", disable = false },
}
