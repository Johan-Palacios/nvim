return {
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      whitespace = {
        remove_blankline_trail = true,
      },
      scope = { highlight = { "RainbowDelimiterViolet" } },
      indent = {
        char = "▏",
      },
      exclude = {
        filetypes = {
          "lspinfo",
          "checkhealth",
          "help",
          "startify",
          "dashboard",
          "packer",
          "neogitstatus",
          "NvimTree",
          "Trouble",
          "dapui_watches",
          "lspinfo",
          "checkhealth",
          "help",
          "man",
          "gitcommit",
          "TelescopePrompt",
          "TelescopeResults",
          "''",
        },
        buftypes = {
          "terminal",
          "nofile",
          "quickfix",
          "prompt",
        },
      },
    },
    config = function(_, opts)
      local status_ok, ibl = pcall(require, "ibl")
      if not status_ok then
        return
      end
      ibl.setup(opts)
    end,
    event = "BufRead",
  },
  {
    "anuvyklack/pretty-fold.nvim",
    config = true,
    event = "BufReadPre",
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      local status_webicons, webicons = pcall(require, "nvim-web-devicons")
      if not status_webicons then
        return
      end

      webicons.setup {
        override = {
          js = {
            icon = "󰌞",
            name = "js",
          },
          toml = {
            icon = "",
            name = "toml",
          },
        },
        color_icons = true,
      }
    end,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
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
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require "core.notify"
    end,
  },
  {
    "stevearc/dressing.nvim",
    opts = {
      input = {
        win_options = {
          winblend = 0,
          wrap = false,
        },
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require "core.colorizer"
    end,
    event = "BufReadPre",
  },
}
