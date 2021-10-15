require"lspconfig".pyright.setup {}
require"lspconfig".bashls.setup {}
require"lspconfig".clangd.setup {}
-- require"lspconfig".tsserver.setup {}
require"lspconfig".cssls.setup {}
require"lspconfig".vuels.setup {}
require"lspconfig".intelephense.setup {}
require"lspconfig".java_language_server.setup {}
require"lspconfig".html.setup {
    capabilities = capabilities,
    filetypes = {"html", "htmldjango"}
}
require"lspconfig".cssls.setup {
    capabilities = capabilities
}
