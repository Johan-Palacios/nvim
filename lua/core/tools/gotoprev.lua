local status_ok, gotoprev = pcall(require, "goto-preview")
if not status_ok then
  return
end

gotoprev.setup {
    width = 120,
    height = 15,
    default_mappings = false,
    debug = false,
    opacity = 0,
    post_open_hook = nil
}
