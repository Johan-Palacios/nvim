vim.cmd "colorscheme onedark"

local colors = {
  red = "#e06c75",
  green = "#98c379",
  blue = "#61afef",
  skyblue = "#55b6c2",
  graylens = "#4e545f",
  grayillum = "#3E4452",
  graydep = "#808080",
  white = "#FFFFFF",
  purple = "#c678dd",
  dark = "#282c33",
}

local hl = vim.api.nvim_set_hl

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
hl(0, "CmpItemKindFunction", { bg = "none", fg = "#C678DD" })
hl(0, "CmpItemKindKeyword", { bg = "none", fg = "#e5c07b" })
hl(0, "LspCodeLens", { bg = "none", fg = colors.graylens })
hl(0, "StatusLine", { bg = "none" })
hl(0, "PmenuSel", { fg = colors.purple, bg = colors.dark })

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
