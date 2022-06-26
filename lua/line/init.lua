local galaxy_status_ok, gl = pcall(require, "galaxyline")
if not galaxy_status_ok then
  return
end

local colors = {
  white = "#abb2bf",
  bg = "#2E2E2E",
  yellow = "#DCDCAA",
  dark_yellow = "#D7BA7D",
  cyan = "#4EC9B0",
  green = "#608B4E",
  insertgreen = "#6a9955",
  light_green = "#B5CEA8",
  string_orange = "#CE9178",
  orange = "#FF8800",
  purple = "#C586C0",
  magenta = "#D16D9E",
  grey = "#858585",
  blue = "#569CD6",
  vivid_blue = "#4FC1FF",
  light_blue = "#9CDCFE",
  red = "#D16969",
  error_red = "#F44747",
  info_yellow = "#FFCC66",
  nord_blue = "#81A1C1",
  statusline_bg = "#22262e",
  lightbg = "#21242B",
  lightbg2 = "#24272F",
  violet = "#8A2BE2",
  darkblue = "#00008B",
  warnyelow = "#FFA500",
  newyellow = "#E5C07B",
  infoblue = "#56B6C2",
  sintaxviolet = "#BA99F6",
  newlighbg = "#5B6477",
  newpurple = "#C678DD",
  replacecolor = "#E06C75",
  line = "#1e2127"
}

local condition = require("galaxyline.condition")
local gls = gl.section
gl.short_line_list = {
  "NvimTree",
  "vista",
  "dbui",
  "packer",
  "tagbar",
  "telescope",
  "toggleterm",
  "Alpha-nvim",
  "Outline",
}
local extension = require("line.extension")

vim.fn.getbufvar(0, "ts")
-- 1
table.insert(gls.left, {
  ViMode = {
    provider = function()
      local mode_color = {
        n = colors.blue,
        i = colors.insertgreen,
        v = colors.newpurple,
        [""] = colors.newpurple,
        V = colors.newpurple,
        c = colors.magenta,
        no = colors.blue,
        s = colors.orange,
        S = colors.orange,
        ic = colors.yellow,
        R = colors.red,
        Rv = colors.red,
        cv = colors.blue,
        ce = colors.blue,
        r = colors.replacecolor,
        rm = colors.replacecolor,
        ["r?"] = colors.cyan,
        ["!"] = colors.blue,
        t = colors.blue,
      }
      vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()])
      return "  ▊"
    end,
    separator_highlight = "StatusLineSeparator",
    highlight = "StatusLineNC",
  },
})

vim.fn.getbufvar(0, "ts")

table.insert(gls.left, {
  GitIcon = {
    provider = function()
      return "   "
    end,
    condition = condition.check_git_workspace,
    separator = "",
    highlight = { colors.orange, colors.lightbg },
  },
})
-- 3
table.insert(gls.left, {
  GitBranch = {
    provider = "GitBranch",
    condition = condition.check_git_workspace,
    separator = " ",
    separator_highlight = { colors.lightbg, colors.lightbg },
    highlight = { colors.white, colors.lightbg },
  },
})

table.insert(gls.left, {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = "  ",
    highlight = { colors.error_red },
  },
})
table.insert(gls.left, {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "  ",
    highlight = { colors.newyellow },
  },
})

table.insert(gls.right, {
  DiffAdd = {
    provider = "DiffAdd",
    condition = condition.hide_in_width,
    icon = "  ",
    highlight = { colors.light_green },
  },
})

table.insert(gls.right, {
  DiffModified = {
    provider = "DiffModified",
    condition = condition.hide_in_width,
    icon = "  柳 ",
    highlight = { colors.light_blue },
  },
})

table.insert(gls.right, {
  DiffRemove = {
    provider = "DiffRemove",
    condition = condition.hide_in_width,
    icon = "  ",
    highlight = { colors.red },
  },
})

table.insert(gls.right, {
  Tabstop = {
    provider = function()
      return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " "
    end,
    condition = condition.hide_in_width,
    separator = " ",
    separator_highlight = "StatusLineSeparator",
    highlight = "StatusLineNC",
  },
})

table.insert(gls.right, {
  BufferType = {
    provider = "FileTypeName",
    condition = condition.hide_in_width,
    separator = " ",
    separator_highlight = "StatusLineSeparator",
    highlight = "StatusLineNC",
  },
})

table.insert(gls.right, {
  LineInfo = {
    provider = "LineColumn",
    separator = "  ",
    separator_highlight = "StatusLineSeparator",
    highlight = "StatusLineNC",
  },
})

table.insert(gls.right, {
  ScrollBar = {
    provider = extension.scrollbar_instance,
    highlight = { colors.blue, colors.gray },
  },
})

table.insert(gls.right, {
  Space = {
    provider = function()
      return " "
    end,
    separator = " ",
    separator_highlight = "StatusLineSeparator",
    highlight = "StatusLineNC",
  },
})

table.insert(gls.short_line_left, {
  BufferType = {
    provider = "FileTypeName",
    separator = " ",
    separator_highlight = "StatusLineSeparator",
    highlight = "StatusLineNC",
  },
})

table.insert(gls.short_line_left, {
  SFileName = {
    provider = "SFileName",
    condition = condition.buffer_not_empty,
    highlight = "StatusLineNC",
  },
})

table.insert(gls.short_line_right, {
  BufferIcon = {
    provider = "BufferIcon",
    highlight = { colors.blue, colors.black },
  },
})
