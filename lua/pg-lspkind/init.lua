local M = {}
require("lspkind").init(
    {
        with_text = true,
        preset = "codicons",
        symbol_map = {
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
    }
)
return M
