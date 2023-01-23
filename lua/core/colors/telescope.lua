local get_hlgroup = require("core.functions").get_hlgroup
local colors = require "core.colors.colortheme"

local normal = get_hlgroup "Normal"
local customnormal = colors.normal
local bg = normal.bg
-- local fg, bg = colors.normal, colors.normal
local green = get_hlgroup("String").fg
local red = get_hlgroup("Error").fg

return {
  TelescopeBorder = { fg = bg, bg = bg },
  TelescopeNormal = { bg = bg },
  TelescopePreviewBorder = { fg = bg, bg =bg },
  TelescopePreviewNormal = { bg = bg },
  TelescopePreviewTitle = { fg = bg, bg = green },
  TelescopePromptBorder = { fg = customnormal, bg = customnormal },
  TelescopePromptNormal = { fg = colors.white, bg = customnormal },
  TelescopePromptPrefix = { fg = red, bg = customnormal },
  TelescopePromptTitle = { fg = bg, bg = red },
  TelescopeResultsBorder = { fg = bg, bg = bg },
  TelescopeResultsNormal = { bg = bg },
  TelescopeResultsTitle = { fg = bg, bg = bg },
}
