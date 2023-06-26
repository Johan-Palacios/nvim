return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local null_ls_status_ok, null = pcall(require, "null-ls")
      if not null_ls_status_ok then
        return
      end

      local formatting = null.builtins.formatting
      local diagnostics = null.builtins.diagnostics
      local code_actions = null.builtins.code_actions

      null.setup {
        debug = false,
        sources = {
          require "typescript.extensions.null-ls.code-actions",
          -- formatting
          formatting.prettier,
          formatting.black.with { extra_args = { "--fast" } },
          formatting.stylua,
          formatting.clang_format.with { filetypes = { "c", "cpp", "cuda", "cs" } },
          formatting.google_java_format.with { filetypes = { "java" } },
          formatting.markdownlint,
          -- diagnostics
          diagnostics.flake8,
          diagnostics.eslint,
          -- code Actions
          code_actions.eslint,
        },
      }
    end,
  },
}
