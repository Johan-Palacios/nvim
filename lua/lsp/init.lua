local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("lsp.lspinstaller")
require("lsp.handler").setup()
require("lsp.null")

-- NOTE: Colores en pupup y en menu de autocompletado
vim.cmd([[autocmd ColorScheme * highlight NormalFloat guibg=#1E2127]])
vim.cmd([[autocmd ColorScheme * highlight FloatBorder guibg=#1E2127]])
