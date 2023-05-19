local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  return
end

local icons = require "core.icons"

navic.setup {
  icons = icons.kind,
  highlight = true,
  separator = " > ",
  depth_limit = 0,
  depth_limit_indicator = "..",
}
