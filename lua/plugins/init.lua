return {
  -- COLORSCHEMA

  {
    "Johan-Palacios/onedarker",
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme "onedarker"
      -- Transparent
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = "#ABB2BF" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
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

  -- GIT

  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      require "core.gitsigns"
    end,
  },
  { "tpope/vim-fugitive", event = "VeryLazy" },
  {
    "akinsho/git-conflict.nvim",
    event = "VeryLazy",
  },

  -- COSTMETICS

  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require "core.tools.webicons"
    end,
  },
  {
    "goolord/alpha-nvim",
    config = function()
      require "core.alpha"
    end,
  },
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
  {
    "anuvyklack/pretty-fold.nvim",
    config = true,
    event = "BufReadPre",
  },

  -- DEBUGERS

  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    lazy = true,
    config = function()
      require "core.dap"
    end,
    dependencies = { "rcarriga/nvim-dap-ui" },
  },
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

  -- TERMINAL

  {
    "akinsho/nvim-toggleterm.lua",
    lazy = true,
    config = function()
      require "core.terminal"
    end,
    event = "VeryLazy",
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

  -- AUTOCOMPLETE

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require "core.cmp"
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "f3fora/cmp-spell",
    },
  },

  { "L3MON4D3/LuaSnip", event = "InsertEnter", dependencies = {
    "friendly-snippets",
  } },
  { "rafamadriz/friendly-snippets", event = "InsertEnter" },

  -- LSP
  { "williamboman/mason.nvim" },
  { "lvimuser/lsp-inlayhints.nvim" },
  { "ray-x/lsp_signature.nvim" },

  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "tamago324/nlsp-settings.nvim",
    },
  },
  { "folke/neodev.nvim", config = true },
  {
    "j-hui/fidget.nvim",
    opts = {
      text = {
        spinner = "dots",
      },
      window = {
        blend = 0,
      },
    },
    event = "VeryLazy",
  },

  {
    "LunarVim/bigfile.nvim",
    config = true,
    event = { "BufReadPre", "FileReadPre" },
  },

  -- FORMAT

  { "tamago324/nlsp-settings.nvim" },
  { "b0o/SchemaStore.nvim" },
  {
    "jose-elias-alvarez/null-ls.nvim",
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

  -- LANGUAGE TOOLS

  { "simrat39/rust-tools.nvim", event = "VeryLazy" },
  { "mfussenegger/nvim-jdtls", event = "VeryLazy" },
  { "p00f/clangd_extensions.nvim", event = "VeryLazy" },
  { "jose-elias-alvarez/typescript.nvim", event = "VeryLazy" },
}
