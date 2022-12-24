local status_ok, number = pcall(require, "numb")
if not status_ok then
  return
end
number.setup {
  show_numbers = true,
  show_cursorline = true
}
