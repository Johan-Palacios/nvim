require("notify").setup({
  background_colour = "#1E2127",
  stages = "fade_in_slide_out",
  on_open = nil,
  render = "default",
  timeout = 1000,
  minimum_width = 50,
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})
-- require("notify").history()
