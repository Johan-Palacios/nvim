return {
  -- COLORSCHEMA

  {
    "joshdick/onedark.vim",
    lazy = false,
    priority = 1000,
    config = function()
      require "core.colors.theme"
    end,

  },

  -- MANAGMENT PLUGINS
  { "folke/lazy.nvim", tag = "stable" },
  { "tweekmonster/startuptime.vim", cmd = "StartupTime", event = "VeryLazy" },
  { "antoinemadec/FixCursorHold.nvim" },
  { "vim-scripts/restore_view.vim" },
  { "moll/vim-bbye", event = "VeryLazy" },
  { "rcarriga/nvim-notify", event = "VeryLazy" },
  { "ahmedkhalf/project.nvim" },

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
    config = true,
    event = "VeryLazy",
  },

  -- COSTMETICS

  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require "core.tools.webicons"
    end,
  },
  { "goolord/alpha-nvim" },
  {
    "nvim-lualine/lualine.nvim",
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

  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui" },
  -- SINTAX HIGHLIGHT

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "core.treesiter"
    end,
    build = ":TSUpdate",
  },

  { "mrjones2014/nvim-ts-rainbow", event = "VeryLazy" },
  { "JoosepAlviste/nvim-ts-context-commentstring", event = "VeryLazy" },
  { "RRethy/vim-illuminate", event = "VeryLazy" },

  { "windwp/nvim-ts-autotag", config = true },
  -- MOVEMENT TOOLS

  { "andymass/vim-matchup", event = "BufRead" },
  { "nvim-lua/plenary.nvim" },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require "core.tools.autopairs"
    end,
  },
  { "tpope/vim-surround", event = "BufRead" },
  { "nvim-telescope/telescope.nvim", event = "VeryLazy" },
  { "matbme/JABS.nvim", event = "VeryLazy" },
  { "Pocco81/AutoSave.nvim" },
  { "nacro90/numb.nvim", lazy = true },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end,
    event = "BufWinEnter",
  },
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      vim.keymap.set({ "n" }, "s", "<Plug>(leap-forward-to)")
      vim.keymap.set({ "n" }, "S", "<Plug>(leap-backward-to)")
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },

  -- CODE HELP TOOLS

  {
    "numToStr/Comment.nvim",
    config = function()
      require "core.comment"
    end,
    event = "BufRead",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
  },

  -- TERMINAL

  {
    "akinsho/nvim-toggleterm.lua",
    event = "VeryLazy",
  },

  -- PROBLEMS NVIM

  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require "core.tools.trouble"
    end,
  },

  -- TREE
  {
    "NvChad/base46",
  },

  {
    "kyazdani42/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
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

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
      "lvimuser/lsp-inlayhints.nvim",
      "tamago324/nlsp-settings.nvim",
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      "ray-x/lsp_signature.nvim",
      "glepnir/lspsaga.nvim",
      "lvimuser/lsp-inlayhints.nvim",
    },
  },
  {
    "j-hui/fidget.nvim",
    config = true,
    event = "VeryLazy",
  },

  -- FORMAT

  { "b0o/SchemaStore.nvim" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "editorconfig/editorconfig-vim", event = "VeryLazy" },

  -- WINBAR

  {
    "SmiteshP/nvim-navic",
    event = { "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
    config = function()
      require "core.navic"
    end,
    dependencies = "neovim/nvim-lspconfig",
  },

  -- LANGUAGE TOOLS

  { "simrat39/rust-tools.nvim", event = "VeryLazy" },
  { "mfussenegger/nvim-jdtls", event = "VeryLazy" },
  { "p00f/clangd_extensions.nvim", event = "VeryLazy" },
}
