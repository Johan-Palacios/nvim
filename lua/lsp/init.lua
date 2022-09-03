local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("lsp.lspinstaller")
require("lsp.handler").setup()
require("lsp.null")
require("lsp.lsp-saga")
require("lsp.inlayhints")

-- NOTE: Colores en pupup y en menu de autocompletado
vim.cmd([[autocmd ColorScheme * highlight NormalFloat guibg=#1E2127]])
vim.cmd([[autocmd ColorScheme * highlight FloatBorder guibg=#1E2127]])
vim.api.nvim_command [[ hi def link LspReferenceText CursorLine ]]
vim.api.nvim_command [[ hi def link LspReferenceWrite CursorLine ]]
vim.api.nvim_command [[ hi def link LspReferenceRead CursorLine ]]
