local status_ok, color = pcall(require, "colorizer")
if not status_ok then
  return
end

color.setup({ "*" }, {
  RGB = true,
  RRGGBB = true,
  names = false,
  RRGGBBAA = true,
  rgb_fn = false,
  hsl_fn = false,
  css = false,
  css_fn = false,
  mode = "background",
})
