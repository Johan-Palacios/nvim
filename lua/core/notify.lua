local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end

notify.setup {
  background_colour = "Normal",
  timeout = 175,
  stages = "fade_in_slide_out",
  render = "default",
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
}

local log = require("plenary.log").new {
  plugin = "notify",
  level = "error",
  use_console = false,
}

vim.notify = function(msg, level, opts)
  log.info(msg, level, opts)
  require "notify"(msg, level, opts)
end

local notify_filter = vim.notify
vim.notify = function(msg, ...)
  if msg:match "character_offset must be called" then
    return
  end
  if msg:match "method textDocument" then
    return
  end
  if msg:match "documentSymbols" then
    return
  end

  notify_filter(msg, ...)
end
