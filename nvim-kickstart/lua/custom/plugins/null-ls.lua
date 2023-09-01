local null_ls = require 'null-ls'
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
return {
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    require('null-ls').setup {
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
      },
      -- format on save
      on_attach = function(current_client, bufnr)
        if current_client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format {
                filter = function(client)
                  --  only use null-ls for formatting instead of lsp server
                  return client.name == 'null-ls'
                end,
                bufnr = bufnr,
              }
            end,
          })
        end
      end,
    }
  end,
  requires = { 'nvim-lua/plenary.nvim' },
}
