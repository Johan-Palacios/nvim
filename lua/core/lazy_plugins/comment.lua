local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup {
  active = true,
  on_config_done = nil,
  padding = true,
  sticky = true,
  ignore = "^$",
  mappings = {
    basic = true,
    extra = true,
  },
  toggler = {
    line = "gcc",
    block = "gbc",
  },
  opleader = {
    line = "gc",
    block = "gb",
  },
  extra = {
    above = "gcO",
    below = "gco",
    eol = "gcA",
  },
  post_hook = nil,
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
}
