local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
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
  statusline_bg = "#22262e",
  lightbg = "#21242B",
  git = "#FF8800",
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
  status_text = "#4e545f",
  branch_name = "#a4abb7",
  branch_cover = "#21242B",
  line = "#1e2127"
}

local onedark_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.black, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  }
}

vim.api.nvim_set_hl(0, "SLGitIcon", { fg = colors.git, bg = colors.line })
vim.api.nvim_set_hl(0, "SLBranchName", { fg = colors.branch_name, bg = colors.branch_cover, bold = false })
vim.api.nvim_set_hl(0, "SLProgress", { fg = colors.blue, bg = colors.line })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = colors.blue, bg =  colors.branch_cover})

local mode_color = {
  n = "#569cd6",
  i = "#6a9955",
  v = "#c586c0",
  -- [""] = "#c586c0",
  V = "#c586c0",
  -- c = '#B5CEA8',
  -- c = '#D7BA7D',
  c = "#4EC9B0",
  no = "#569cd6",
  s = "#ce9178",
  S = "#ce9178",
  [""] = "#ce9178",
  ic = "#dcdcaa",
  R = "#d16969",
  Rv = "#d16969",
  cv = "#569cd6",
  ce = "#569cd6",
  r = "#d16969",
  rm = "#4EC9B0",
  ["r?"] = "#4EC9B0",
  ["!"] = "#4EC9B0",
  t = "#D7BA7D",
}

local mode = {
  function()
    return "▊"
  end,
  color = function()
    return { fg = mode_color[vim.fn.mode()], bg = mode_color[vim.fn.mode()] }
  end,
  padding = 0,
}

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local icons = require "core.icons"

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = icons.diagnostics.Error .. " ", warn = icons.diagnostics.Warning .. " " },
  colored = true,
  color = { bg = colors.line },
  update_in_insert = false,
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " },
  cond = hide_in_width,
  color = { bg = colors.line },
}

local filetype = {
  "filetype",
  icons_enabled = true,
  color = { bg = colors.line, fg = colors.status_text },
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "%#SLGitIcon#" .. "" .. "%*" .. "%#SLBranchName#",
  separator = { left = '', right = '' },
  colored = false,
}

local progress = {
  "progress",
  fmt = function()
    local current_line = vim.fn.line "."
    local total_lines = vim.fn.line "$"
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return "%#SLProgress#" .. chars[index] .. "%*"
  end
}

local spaces = {
  function()
    return "Spaces " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end,
  color = { bg = "#1e2127", fg = "#4e545f" },
  padding = 0,
  separator = "%#SLSeparator#" .. " │" .. "%*",
}

local location = {
  "location",
  color = function()
    return { bg = colors.line, fg = colors.status_text }
  end,
}

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = onedark_theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "packer", "Outline", "toggleterm" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode, branch },
    lualine_b = { diagnostics },
    lualine_c = { { cond = hide_in_width } },
    lualine_x = { diff, spaces, filetype },
    lualine_y = { location },
    lualine_z = { progress },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
