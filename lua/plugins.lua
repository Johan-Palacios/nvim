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
  { "moll/vim-bbye" },
  { "rcarriga/nvim-notify" },
  { "ahmedkhalf/project.nvim" },

  -- GIT

  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      require "core.lazy_plugins.gitsigns"
    end,
  },
  { "tpope/vim-fugitive", event = "BufWinEnter" },
  {
    "akinsho/git-conflict.nvim",
    config = function()
      require("git-conflict").setup()
    end,
    event = "VeryLazy",
  },

  -- COSTMETICS

  { "kyazdani42/nvim-web-devicons" },
  { "goolord/alpha-nvim" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
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
    config = function()
      require("pretty-fold").setup {}
    end,
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
    dependencies = {
      { "JoosepAlviste/nvim-ts-context-commentstring" },
      "p00f/nvim-ts-rainbow",
    },
  },

  { "p00f/nvim-ts-rainbow", event = "VeryLazy" },
  { "JoosepAlviste/nvim-ts-context-commentstring", event = "VeryLazy" },
  { "RRethy/vim-illuminate", event = "VeryLazy" },

  -- MOVEMENT TOOLS

  { "andymass/vim-matchup", event = "BufRead" },
  { "nvim-lua/plenary.nvim" },
  { "windwp/nvim-autopairs", event = "InsertEnter" },
  { "tpope/vim-surround", event = "BufRead" },
  { "nvim-telescope/telescope.nvim" },
  { "matbme/JABS.nvim" },
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
      require "core.lazy_plugins.comment"
    end,
    event = "BufRead",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },
  { "AndrewRadev/tagalong.vim" },
  { "alvan/vim-closetag" },
  {
    "NvChad/nvim-colorizer.lua",
  },

  -- TERMINAL

  {
    "akinsho/nvim-toggleterm.lua",
    event = "VeryLazy",
  },

  -- PROBLEMS NVIM

  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require "core.tools.trouble"
    end,
  },

  -- TREE

  {
    "kyazdani42/nvim-tree.lua",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require "core.tree"
    end,
  },

  -- AUTOCOMPLETE

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "f3fora/cmp-spell",
      "rafamadriz/friendly-snippets",
    },
  },

  { "hrsh7th/cmp-nvim-lsp", lazy = true },
  { "hrsh7th/cmp-buffer", lazy = true },
  { "saadparwaiz1/cmp_luasnip", lazy = true },
  { "hrsh7th/cmp-path", lazy = true },
  { "hrsh7th/cmp-nvim-lua", lazy = true },
  { "f3fora/cmp-spell", lazy = true },
  { "L3MON4D3/LuaSnip", event = "InsertEnter", dependencies = {
    "friendly-snippets",
  } },
  { "rafamadriz/friendly-snippets", lazy = true },

  -- LSP

  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
      "lvimuser/lsp-inlayhints.nvim",
      "tamago324/nlsp-settings.nvim",
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      "ray-x/lsp_signature.nvim",
      "glepnir/lspsaga.nvim",
      "lvimuser/lsp-inlayhints.nvim",
      "j-hui/fidget.nvim",
    },
  },
  { "williamboman/mason-lspconfig.nvim", lazy = true },
  { "williamboman/mason.nvim", lazy = true },
  { "lvimuser/lsp-inlayhints.nvim", lazy = true },
  { "tamago324/nlsp-settings.nvim", lazy = true },
  { "jose-elias-alvarez/nvim-lsp-ts-utils", lazy = true },
  { "ray-x/lsp_signature.nvim", lazy = true },
  { "glepnir/lspsaga.nvim", lazy = true },
  { "lvimuser/lsp-inlayhints.nvim", lazy = true },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup {}
    end,
  },

  -- FORMAT

  { "b0o/SchemaStore.nvim", lazy = true },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
  },
  { "editorconfig/editorconfig-vim" },

  -- WINBAR

  {
    "SmiteshP/nvim-navic",
    event = { "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
    config = function()
      require "core.gps"
    end,
    dependencies = "neovim/nvim-lspconfig",
  },

  -- LANGUAGE TOOLS

  { "simrat39/rust-tools.nvim" },
  { "mfussenegger/nvim-jdtls" },
  { "p00f/clangd_extensions.nvim" },
}
