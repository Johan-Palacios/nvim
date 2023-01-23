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

vim.api.nvim_set_hl(0, "NavicIconsFile", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsModule", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsNamespace", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsPackage", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsClass", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsMethod", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsProperty", { default = false, bg = "", fg = "#61aFeF" })
vim.api.nvim_set_hl(0, "NavicIconsField", { default = false, bg = "", fg = "#55b6c2" })
vim.api.nvim_set_hl(0, "NavicIconsConstructor", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsEnum", { default = false, bg = "", fg = "#abb2bf" })
vim.api.nvim_set_hl(0, "NavicIconsInterface", { default = false, bg = "", fg = "#E06c75" })
vim.api.nvim_set_hl(0, "NavicIconsFunction", { default = false, bg = "", fg = "#C678DD" })
vim.api.nvim_set_hl(0, "NavicIconsVariable", { default = false, bg = "", fg = "#E06c75" })
vim.api.nvim_set_hl(0, "NavicIconsConstant", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsString", { default = false, bg = "", fg = "#98C379" })
vim.api.nvim_set_hl(0, "NavicIconsNumber", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsBoolean", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsArray", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsObject", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsKey", { default = false, bg = "", fg = "#e5c07b" })
vim.api.nvim_set_hl(0, "NavicIconsNull", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsStruct", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsEvent", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicText", { default = false, bg = "", fg = "#9095a2" })
vim.api.nvim_set_hl(0, "NavicSeparator", { default = false, bg = "", fg = "#9095a2" })
