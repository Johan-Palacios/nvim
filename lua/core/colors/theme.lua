vim.cmd "colorscheme onedark"

local colors = require "core.colors.colortheme"
local telescope = require "core.colors.telescope"

local hl = vim.api.nvim_set_hl

local native = require "core.colors.native"

local theme = vim.tbl_deep_extend("force", native, telescope)

hl(0, "CmpItemKindSnippet", { bg = "none", fg = colors.red })
hl(0, "CmpItemKindMethod", { bg = "none", fg = colors.red })
hl(0, "CmpItemKindInterface", { bg = "none", fg = colors.red })
hl(0, "CmpItemKindText", { bg = "none", fg = colors.green })
hl(0, "CmpItemKindText", { bg = "none", fg = colors.green })
hl(0, "CmpItemAbbrMatch", { bg = "none", fg = colors.blue })
hl(0, "CmpItemKindProperty", { bg = "none", fg = colors.blue })
hl(0, "CmpItemKindUnit", { bg = "none", fg = "#abb2bf" })
hl(0, "CmpItemAbbrMatchFuzzy", { bg = "none", fg = colors.skyblue })
hl(0, "CmpItemKindVariable", { bg = "none", fg = "#BA99F6" })
hl(0, "CmpItemKindFunction", { bg = "none", fg = colors.purple })
hl(0, "CmpItemKindKeyword", { bg = "none", fg = "#e5c07b" })

for group, props in pairs(theme) do
  hl(0, group, props)
end

-- -- TODO: Refactor in Lua
-- vim.cmd [[
--   highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
--   hi def IlluminatedWordText guibg=#3E4452 guifg=NONE
--   hi def IlluminatedWordRead guibg=#3E4452 guifg=NONE
--   hi def IlluminatedWordWrite guibg=#3E4452 guifg=NONE
--   hi def WhichKeyBorder guibg=NONE guifg=#4e545f
-- ]]
