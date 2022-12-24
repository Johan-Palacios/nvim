local status_ok, jabs = pcall(require, "jabs")
if not status_ok then
  return
end

jabs.setup {
  position = "center",
  width = 50,
  height = 10,
  border = "rounded",
  preview_position = "top",
  preview = {
    width = 70,
    height = 20,
    border = "rounded",
  },
}
