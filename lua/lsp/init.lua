require "lsp.keys"
-- NOTE: Colores en pupup y en menu de autocompletado
vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1E2127]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guibg=#1E2127]]
vim.cmd [[
    sign define DiagnosticSignError text=  linehl= texthl=DiagnosticSignError numhl=
    sign define DiagnosticSignWarn text= linehl= texthl=DiagnosticSignWarn numhl=
    sign define DiagnosticSignInfo text=  linehl= texthl=DiagnosticSignInfo numhl=
    sign define DiagnosticSignHint text=💡  linehl= texthl=DiagnosticSignHint numhl=
]]

local border = {
    {"╭", "floatborder"}, {"▔", "floatborder"}, {"╮", "floatborder"},
    {"▕", "floatborder"}, {"╯", "floatborder"}, {"▁", "floatborder"},
    {"╰", "floatborder"}, {"▏", "floatborder"}
}
-- NOTE: LSP Settings

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
        underline = false,
        update_in_insert = false
    })

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {
            prefix = '●'
        }
    })

-- NOTE: Diagnosticos en la status line
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]

require "lsp.lspconfig"
