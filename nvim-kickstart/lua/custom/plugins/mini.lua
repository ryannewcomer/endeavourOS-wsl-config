return {
  'echasnovski/mini.nvim',
  version = '*',
  lazy = false,
  config = function()
    require('mini.completion').setup {
      lsp_completion = {
        source_func = 'omnifunc',
        auto_setup = false,
        process_items = function(items, base)
          -- Don't show 'Text' and 'Snippet' suggestions
          items = vim.tbl_filter(function(x)
            return x.kind ~= 1 and x.kind ~= 15
          end, items)
          return MiniCompletion.default_process_items(items, base)
        end,
      },
      window = {
        info = { border = 'double' },
        signature = { border = 'double' },
      },
    }
    require('mini.pairs').setup()
  end,
}
