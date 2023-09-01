return {
  "voldikss/vim-floaterm",
  lazy = false,
  keys = {
    { "<leader>t", "<cmd>FloatermNew<cr>", desc == "open float term"},   
    { "<C-t>", "<cmd>FloatermToggle<cr>", desc == "close float term"},
  }
}
