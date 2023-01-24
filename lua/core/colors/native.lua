local colors = require "core.colors.colortheme"
local get_hl = require("core.functions").get_hlgroup
local line = get_hl("Normal").bg
return {
  Normal = { fg = colors.fgnormal, bg = colors.normal },
  LspCodeLens = { bg = "none", fg = colors.graylens },
  PmenuSel = { fg = colors.purple, bg = colors.dark },
  pmenu = { fg = colors.fgnormal, bg = colors.normal },
  Search = { bg = colors.white, fg = colors.normal },
  StatusLine = { bg = line },
  StatusLineNC = { bg = line, fg = line },
}
