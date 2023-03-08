return {
  -- COLORSCHEMA

  {
    "Johan-Palacios/onedarker",
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme "onedarker"
    end,
  },

  -- MANAGMENT PLUGINS
  { "folke/lazy.nvim", tag = "stable" },
  { "tweekmonster/startuptime.vim", cmd = "StartupTime", event = "VeryLazy" },
  { "vim-scripts/restore_view.vim" },
  { "moll/vim-bbye", event = "VeryLazy" },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require "core.notify"
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require "core.session"
    end,
  },


  -- COSTMETICS

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "core.line.lualine"
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require "core.tools.bufferline"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "core.tools.indent"
    end,
    event = "BufRead",
  },

  -- DEBUGERS

  -- SINTAX HIGHLIGHT

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require "core.treesiter"
    end,
    build = ":TSUpdate",
  },

  { "p00f/nvim-ts-rainbow", event = "VeryLazy" },
  { "JoosepAlviste/nvim-ts-context-commentstring", event = "VeryLazy" },
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function()
      require "lsp.illuminate"
    end,
  },
  { "nvim-treesitter/playground", event = "VeryLazy" },
  { "windwp/nvim-ts-autotag", event = "InsertEnter" },
  -- MOVEMENT TOOLS

  {
    "andymass/vim-matchup",
    lazy = true,
    event = "BufRead",
    config = function()
      vim.g.matchup_matchparen_offscreen = {}
    end,
  },
  { "nvim-lua/plenary.nvim", event = "VeryLazy" },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    lazy = true,
    config = function()
      require "core.tools.autopairs"
    end,
  },
  { "tpope/vim-surround", event = { "BufRead" } },
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    config = function()
      require "core.telescope"
    end,
    dependencies = {
      "nvim-telescope/telescope-ui-select.nvim",
    },
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
    "matbme/JABS.nvim",
    config = function()
      require "core.jabs"
    end,
  },
  {
    "Pocco81/AutoSave.nvim",
    event = "InsertLeave",
    lazy = true,
    config = function()
      require "core.autosave"
    end,
  },
  { "nacro90/numb.nvim", lazy = true, event = "BufRead", config = true },
  {
    "karb94/neoscroll.nvim",
    config = true,
    event = "WinScrolled",
  },
  {
    "ggandor/leap.nvim",
    keys = {
      { "s", "<Plug>(leap-forward-to)", mode = { "n" } },
      { "S", "<Plug>(leap-backward-to)", mode = { "n" } },
    },
  },
  {
    "folke/which-key.nvim",
    lazy = true,
    config = function()
      require "core.whichkey"
    end,
    event = "VeryLazy",
  },

  -- CODE HELP TOOLS

  {
    "numToStr/Comment.nvim",
    config = true,
    event = "BufRead",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require "core.todocomments"
    end,
    event = "BufReadPre",
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require "core.colorizer"
    end,
    event = "BufReadPre",
  },


  -- PROBLEMS NVIM

  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require "core.tools.trouble"
    end,
  },

  -- TREE
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VimEnter",
    config = function()
      require "core.tree"
    end,
  },

  {
    "LunarVim/bigfile.nvim",
    config = true,
    event = { "BufReadPre", "FileReadPre" },
  },

  { "editorconfig/editorconfig-vim" },

  -- WINBAR

  {
    "SmiteshP/nvim-navic",
    event = { "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
    lazy = true,
    config = function()
      require "core.navic"
    end,
    dependencies = { "neovim/nvim-lspconfig" },
  },

}
