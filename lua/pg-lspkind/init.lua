local M = {}
M.icons = {

    Text = "",
    Method = "ƒ",
    Function = "",
    Constructor = "",
    Variable = "",
    Class = "",
    Interface = "ﰮ",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "了",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Folder = "",
    Operator = "",
    Field = "",
    Buffer = "",
    EnumMember = "",
    Constant = "",
    Spell = "",
    Reference = "",
    TypeParameter = " ",
    Struct = ""
}
function M.setup()
    local kinds = vim.lsp.protocol.CompletionItemKind
    for i, kind in ipairs(kinds) do kinds[i] = M.icons[kind] or kind end
end
-- require("lspkind").init({
--     with_text = true,
--     preset = "codicons",
--     symbol_map = {
--         Text = "",
--         Method = "ƒ",
--         Function = "",
--         Constructor = "",
--         Variable = "",
--         Class = "",
--         Interface = "ﰮ",
--         Module = "",
--         Property = "",
--         Unit = "",
--         Value = "",
--         Enum = "了",
--         Keyword = "",
--         Snippet = "",
--         Color = "",
--         File = "",
--         Folder = "",
--         Operator = "",
--         Field = "",
--         Buffer = "",
--         EnumMember = "",
--         Constant = "",
--         Spell = "",
--         Reference = "",
--         TypeParameter = " ",
--         Struct = ""
--     }
-- })
return M
