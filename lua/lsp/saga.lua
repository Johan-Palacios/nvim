local status_saga, lspsaga = pcall(require, "lspsaga")
if not status_saga then
  return
end

local colors = require "core.colors.colortheme"

lspsaga.setup {
  lightbulb = {
    enable = false,
  },
  symbol_in_winbar = {
    enable = false,
  },
  code_action = {
    num_shortcut = true,
    keys = {
      quit = "q",
      exec = "<CR>",
    },
  },
  ui = {
    theme = "round",
    border = "rounded",
    winblend = 0,
    expand = "",
    collapse = "",
    preview = "﬘ ",
    code_action = "  ",
    diagnostic = " ",
    incoming = " ",
    outgoing = " ",
    colors = {
      --float window normal bakcground color
      normal_bg = colors.normal,
      --title background color
      title_bg = colors.purple,
      red = colors.normal,
      magenta = colors.purple,
      orange = "#FF8700",
      yellow = "#f7bb3b",
      green = colors.green,
      cyan = colors.skyblue,
      blue = colors.blue,
      purple = "#CBA6F7",
      white = colors.white,
      black = colors.normal,
    },
  },
}