local colors = {
  grey = "#42464e",
  blue = "#61afef",
}

local status_webicons, webicons = pcall(require, "nvim-web-devicons")
if not status_webicons then
  return
end

webicons.set_icon {
  ino = {
    icon = "",
    color = colors.blue,
    name = "ino",
  },
  editorconfig = {
    icon = "e",
    color = colors.grey,
    name = "editorconfig",
  },
}
