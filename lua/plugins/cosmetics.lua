return {
  {
    "anuvyklack/pretty-fold.nvim",
    config = true,
    event = "BufReadPre",
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      local status_webicons, webicons = pcall(require, "nvim-web-devicons")
      if not status_webicons then
        return
      end

      local colors = {
        grey = "#42464e",
        blue = "#61afef",
      }

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
    end,
  },
  {
    "goolord/alpha-nvim",
    config = function()
      local status_ok, alpha = pcall(require, "alpha")
      if not status_ok then
        return
      end

      local dashboard = require "alpha.themes.dashboard"
      dashboard.section.header.val = {
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣤⣤⣤⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣤⣤⣶⣶⣶⣿⣿⣿⣿⣯⣯⣯⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣦⣦⣿⣯⣯⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣯⣇⣇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣯⣿⠿⠿⠿⠿⠿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣇⢇⢇⣿⣯⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣯⣇⣇⢿⣯⣿⣿⣿⣿⣿⣯⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢫⣇⣇⢟⣯⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠫⣇⣇⢏⣿⣿⣿⣿⣿⣿⣿⣯⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣯⣇⢇⣿⣯⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣯⣇⣇⢿⣯⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢯⣇⣇⢻⣯⣿⣿⣿⣿⣿⣿⣯⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢫⣇⣇⢟⣯⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⢀⣀⣤⣶⣿⣿⣤⠀⠀⠀⠀⠀⠀⠀⢫⣇⣇⢏⣯⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⢠⣤⠀⠀⠀⣤⣤⠀⣤⡄⠀⣤⣤⠀⠀⠀⠀⣤⣤⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢦⣯⣯⢟⣯⣿⣿⣿⣿⣯⣿⣤⠀⠀⠀⠀⠀⠀⣯⣇⣇⣿⣿⣿⣿⣿⣿⣿⣿⣿   ⣿⣧⠀⠀⣿⡏⠀⣿⡇⠀⣿⣿⣦⠀⠀⣼⣿⣯⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢫⣇⣇⢏⣿⣿⣿⣿⣿⣿⣯⣿⣶⣤⣤⣀⣤⣧⣧⣿⣯⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⢹⣿⠀⣼⣿⠀⠀⣿⡇⠀⣿⣯⣿⡄⢰⣿⣿⣯ ",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣇⣇⢎⣿⣯⣿⣿⣿⣿⣿⣿⣿⣿⣯⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀ ⠀⣿⣧⣿⠃⠀⠀⣿⡇⠀⣿⣯⠘⣿⣿⠁⣿⣯⠀ ",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠋⣯⣇⢏⢿⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⠿⠉⠀⠀⠀  ⠘⣿⣿⠀⠀⠀⣿⡇⠀⣿⣯⠀⠉⠉⠀⣿⣯⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠋⠫⢏⣟⢻⢿⣿⣯⣯⣯⣯⣯⣯⠿⠟⠛⠉⠀⠀⠀⠀⠀⠀",
      }
      dashboard.section.buttons.val = {
        dashboard.button("SPC f", "  Find file", ":Telescope find_files <CR>"),
        dashboard.button("SPC e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("SPC p", "  Find project", ":Telescope projects <CR>"),
        dashboard.button("SPC r", "  Recently used files", ":Telescope oldfiles <CR>"),
        dashboard.button("SPC g", "  Find text", ":Telescope live_grep <CR>"),
        dashboard.button("SPC c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
        dashboard.button("SPC q", "  Quit Neovim", ":qa<CR>"),
      }

      local function footer()
        return "⚡ Neovim (JVIM)"
      end

      dashboard.section.footer.val = footer()

      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "Include"
      dashboard.section.buttons.opts.hl = "Keyword"

      dashboard.opts.opts.noautocmd = true

      vim.cmd [[
      autocmd User AlphaReady set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
      ]]

      alpha.setup(dashboard.opts)
    end,
  },
}
