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
            prefix = '●' -- Could be '●', '▎', 'x'
        }
    })

-- NOTE: Diagnosticos en la status line
-- function PrintDiagnostics(opts, bufnr, line_nr, client_id)
--     opts = opts or {}
--
--     bufnr = bufnr or 0
--     line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
--
--     local line_diagnostics = vim.lsp.diagnostic.get_line_diagnostics(bufnr,
--                                                                      line_nr,
--                                                                      opts,
--                                                                      client_id)
--     if vim.tbl_isempty(line_diagnostics) then return end
--
--     local diagnostic_message = ""
--     for i, diagnostic in ipairs(line_diagnostics) do
--         diagnostic_message = diagnostic_message ..
--                                  string.format("%d: %s", i,
--                                                diagnostic.message or "")
--         print(diagnostic_message)
--         if i ~= #line_diagnostics then
--             diagnostic_message = diagnostic_message .. "\n"
--         end
--     end
--     vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
-- end
-- vim.cmd [[ autocmd CursorHold * lua PrintDiagnostics() ]]
--
-- Mostrar diagnosticos solo al mantener
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})

-- NOTE: Configs of lspinstall

require"lspinstall".setup()
require"lspinstall".installed_servers()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {"documentation", "detail", "additionalTextEdits"}
}

require "lsp.lspconfig"
