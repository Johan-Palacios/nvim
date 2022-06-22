local status_ok, color = pcall(require, "colorizer")
if not status_ok then
  return
end

color.setup({ "*" }, {
  RGB = true,
  RRGGBB = true,
  names = true,
  RRGGBBAA = true,
  rgb_fn = true,
  hsl_fn = true,
  css = false,
  css_fn = false,
  mode = "background",
})
