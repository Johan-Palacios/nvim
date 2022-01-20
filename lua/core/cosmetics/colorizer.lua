local status_ok, color = pcall(require, "colorizer")
if not status_ok then
  return
end

color.setup()
