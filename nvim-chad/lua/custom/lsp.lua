local null_ls = require("null-ls")
local lspconfig = require("lspconfig")

-- Configure null-ls
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.deno_fmt,
    null_ls.builtins.formatting.google_java_format,
    null_ls.builtins.formatting.stylua,
  },
})

-- Configure lspconfig with null-ls
local filetypes = {
  "javascript",
  "typescript",
  "typescriptreact",
  "java",
  "python",
}

for _, filetype in ipairs(filetypes) do
  lspconfig[filetype].setup({
    -- ... other LSP settings ...

    on_attach = function(client)
      -- Set up null-ls as a formatting provider
      require("lspconfig")["null-ls"].setup({
        on_attach = function(bufnr)
          require("null-ls").setup({
            sources = {
              null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.deno_fmt,
    null_ls.builtins.formatting.google_java_format,
    null_ls.builtins.formatting.stylua,

                          },
          })
          vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        end,
      })
      -- ... other on_attach actions ...
    end,
  })

  -- Enable autoformat on save
  vim.api.nvim_exec(string.format([[
  augroup FormatAutogroup_%s
    autocmd!
    autocmd BufWritePost *.%s FormatWrite
  augroup END
  ]], filetype, filetype), true)
end
