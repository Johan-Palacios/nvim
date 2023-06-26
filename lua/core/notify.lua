---@diagnostic disable: duplicate-set-field
local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end

notify.setup {
  background_colour = "#1e2127",
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
  if msg:match "character_offset must be called" then
    return
  end
  if msg:match "method textDocument" then
    return
  end
  if msg:match "warning: multiple different client offset_encodings detected for buffer, this is not supported yet" then
    return
  end
  if msg:match "documentSymbols" then
    return
  end
  notify(msg, level, opts)
end
