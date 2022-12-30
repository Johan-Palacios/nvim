vim.cmd "colorscheme onedark"

local hl = vim.api.nvim_set_hl

hl(0, "CmpItemKindSnippet", { bg = "none", fg = "#e06c75" })
hl(0, "CmpItemKindMethod", { bg = "none", fg = "#e06c75" })
hl(0, "CmpItemKindInterface", { bg = "none", fg = "#e06c75" })
hl(0, "CmpItemKindText", { bg = "none", fg = "#98c379" })
hl(0, "CmpItemKindText", { bg = "none", fg = "#98c379" })
hl(0, "CmpItemAbbrMatch", { bg = "none", fg = "#61afef" })
hl(0, "CmpItemKindProperty", { bg = "none", fg = "#61afef" })
hl(0, "CmpItemKindUnit", { bg = "none", fg = "#abb2bf" })
hl(0, "CmpItemAbbrMatchFuzzy", { bg = "none", fg = "#55b6c2" })
hl(0, "CmpItemKindVariable", { bg = "none", fg = "#BA99F6" })
hl(0, "CmpItemKindFunction", { bg = "none", fg = "#C678DD" })
hl(0, "CmpItemKindKeyword", { bg = "none", fg = "#e5c07b" })
hl(0, "LspCodeLens", { bg = "none", fg = "#4e545f" })
hl(0, "StatusLine", { bg = "none" })

-- TODO: Refactor in Lua
vim.cmd [[
  highlight Normal guibg=#1e2127

  highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080

  highlight pmenu ctermbg=DarkGray guibg=onedark
  highlight Search guibg='DarkGray' guifg='Black'

  hi def IlluminatedWordText guibg=#3E4452 guifg=NONE
  hi def IlluminatedWordRead guibg=#3E4452 guifg=NONE
  hi def IlluminatedWordWrite guibg=#3E4452 guifg=NONE
  hi def WhichKeyBorder guibg=NONE guifg=#4e545f
  syntax off
]]
