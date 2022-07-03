local status_ok, noty = pcall(require, "notify")
if not status_ok then
  return
end

noty.setup({
  background_colour = "#1E2127",
	timeout = 1000,
	stages = "fade",
	render = "default",
	icons = {
		ERROR = "",
		WARN = "",
		INFO = "",
		DEBUG = "",
		TRACE = "✎",
	},
})

local log = require("plenary.log").new({
	plugin = "notify",
	level = "error",
	use_console = false,
})

vim.notify = function(msg, level, opts)
	log.info(msg, level, opts)

	require("notify")(msg, level, opts)
end
