return {
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local none_ls_status_ok, none_ls = pcall(require, "null-ls")
      if not none_ls_status_ok then
        return
      end

      local formatting = none_ls.builtins.formatting
      local diagnostics = none_ls.builtins.diagnostics
      local code_actions = none_ls.builtins.code_actions

      none_ls.setup {
        debug = false,
        sources = {
          -- formatting
          -- formatting.prettier,
          formatting.black.with { extra_args = { "--fast" } },
          formatting.stylua,
          formatting.clang_format.with { filetypes = { "c", "cpp", "cuda", "cs" } },
          formatting.google_java_format.with { filetypes = { "java" } },
          formatting.markdownlint,
        },
      }
    end,
  },
}
