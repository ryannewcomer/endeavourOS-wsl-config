local plugins = {
  {
    "embark-theme/vim",
    lazy = false,
    config = function()
      vim.cmd "colorscheme embark"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.lsp"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.lsp"
    end,
  },
}
return plugins
