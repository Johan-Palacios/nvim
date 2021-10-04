vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1E2127]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1E2127]]
local on_attach = function(client, bufnr)
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                                                 vim.lsp.handlers.hover, {
            border = border
        })
    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = border
        })
end
vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false
    })
local lspconfig = require "lspconfig"
local configs = require "lspconfig/configs"
require"lspinstall".setup()
require"lspinstall".installed_servers()

-- require"compe".setup {
--     enabled = true,
--     autocomplete = true,
--     debug = false,
--     min_length = 1,
--     preselect = "enable",
--     throttle_time = 80,
--     source_timeout = 200,
--     incomplete_delay = 400,
--     max_abbr_width = 100,
--     max_kind_width = 100,
--     max_menu_width = 100,
--     documentation = true,
--     source = {
--         path = true,
--         buffer = true,
--         vsnip = true,
--         nvim_lsp = true,
--         nvim_lua = true,
--         spell = true,
--         luasnip = true,
--         snippets_nvim = true,
--         treesitter = true
--     }
-- }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {"documentation", "detail", "additionalTextEdits"}
}

-- require "lspconfig".omnisharp.setup {}
require"lspconfig".pyright.setup {}
require"lspconfig".bashls.setup {}
require"lspconfig".clangd.setup {}
require"lspconfig".tsserver.setup {}
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
