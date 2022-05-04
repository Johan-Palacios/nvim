local status_ok, number = pcall(require, "numb")
if not status_ok then
  return
end
number.setup {
  show_numbers = true, -- Enable 'number' for the window while peeking
  show_cursorline = true -- Enable 'cursorline' for the window while peeking
}
