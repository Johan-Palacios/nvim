local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup {
  debug = false,
  sources = {
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
