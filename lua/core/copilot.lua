local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
  return
end

copilot.setup {
  cmp = {
    enabled = true,
    method = "getPanelCompletions",
  },
  panel = {
    enabled = true,
  },
  ft_disable = { "markdown"},
  -- ft_disable = { "markdown"},
  -- plugin_manager_path = vim.fn.stdpath "data" .. "/site/pack/packer",
  -- server_opts_overrides = {},
}
