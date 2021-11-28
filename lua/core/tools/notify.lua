require("notify").setup({
  background_colour = "#1E2127",
  stages = "slide",
  on_open = nil,
  render = "default",
  timeout = 5000,
  minimum_width = 50,
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})
require("notify").history()
