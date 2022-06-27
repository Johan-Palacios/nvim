local colors = {
  white = "#abb2bf",
  darker_black = "#1b1f27",
  black = "#1e222a",
  black2 = "#252931",
  one_bg = "#282c34",
  one_bg2 = "#353b45",
  one_bg3 = "#30343c",
  grey = "#42464e",
  grey_fg = "#565c64",
  grey_fg2 = "#6f737b",
  light_grey = "#6f737b",
  red = "#d47d85",
  baby_pink = "#DE8C92",
  pink = "#ff75a0",
  line = "#2a2e36",
  green = "#A3BE8C",
  vibrant_green = "#7eca9c",
  nord_blue = "#81A1C1",
  blue = "#61afef",
  yellow = "#e7c787",
  sun = "#EBCB8B",
  purple = "#b4bbc8",
  dark_purple = "#c882e7",
  teal = "#519ABA",
  orange = "#fca2aa",
  cyan = "#a3b8ef",
  statusline_bg = "#22262e",
  lightbg = "#2d3139",
  lightbg2 = "#262a32",
}


require "nvim-web-devicons".setup {
  override = {
    html = {
      icon = "",
      color = colors.baby_pink,
      name = "html"
    },
    css = {
      icon = "",
      color = colors.blue,
      name = "css"
    },
    js = {
      icon = "",
      color = colors.sun,
      name = "js"
    },
    ts = {
      icon = "ﯤ",
      color = colors.teal,
      name = "ts"
    },
    kt = {
      icon = "KT",
      color = colors.orange,
      name = "kt"
    },
    png = {
      icon = "",
      color = colors.dark_purple,
      name = "png"
    },
    jpg = {
      icon = "",
      color = colors.dark_purple,
      name = "jpg"
    },
    jpeg = {
      icon = "",
      color = "colors.dark_purple",
      name = "jpeg"
    },
    mp2 = {
      icon = "",
      color = colors.white,
      name = "mp2"
    },
    mp3 = {
      icon = "",
      color = colors.white,
      name = "mp3"
    },
    out = {
      icon = "",
      color = colors.white,
      name = "out"
    },
    Dockerfile = {
      icon = "",
      color = colors.cyan,
      name = "Dockerfile"
    },
    rb = {
      icon = "",
      color = colors.pink,
      name = "rb"
    },
    vue = {
      icon = "﵂",
      color = colors.vibrant_green,
      name = "vue"
    },
    py = {
      icon = "",
      color = colors.cyan,
      name = "py"
    },
    toml = {
      icon = "",
      color = colors.blue,
      name = "toml"
    },
    lock = {
      icon = "",
      color = colors.red,
      name = "lock"
    },
    zip = {
      icon = "",
      color = colors.sun,
      name = "zip"
    },
    xz = {
      icon = "",
      color = colors.sun,
      name = "xz"
    },
    deb = {
      icon = "",
      color = colors.cyan,
      name = "deb"
    },
    rpm = {
      icon = "",
      color = colors.orange,
      name = "rpm"
    },
    lua = {
      icon = "",
      color = "#007EC6",
      name = "lua"
    }
  }
}
require("nvim-web-devicons").set_icon {
  ino = {
    icon = "",
    color = colors.blue,
    name = "ino"
  }
}
