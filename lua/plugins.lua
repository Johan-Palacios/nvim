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
  { "tpope/vim-fugitive" },
  {
    "akinsho/git-conflict.nvim",
    config = function()
      require("git-conflict").setup()
    end,
    event = "VeryLazy",
  },

  -- COSTMETICS

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

  { "mfussenegger/nvim-dap", dependencies = "rcarriga/nvim-dap-ui", lazy = true },

  -- SINTAX HIGHLIGHT

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile", "BufWinEnter" },
    config = function()
      require "core.treesiter"
    end,
    build = ":TSUpdate",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "p00f/nvim-ts-rainbow",
    },
  },
  { "RRethy/vim-illuminate", event = "BufRead" },

  -- MOVEMENT TOOLS

  { "andymass/vim-matchup", event = "BufRead" },
  { "tpope/vim-unimpaired" },
  { "nvim-lua/plenary.nvim" },
  { "windwp/nvim-autopairs" },
  { "tpope/vim-surround" },
  { "nvim-telescope/telescope.nvim" },
  { "matbme/JABS.nvim" },
  { "Pocco81/AutoSave.nvim" },
  { "nacro90/numb.nvim", lazy = true },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end,
    lazy = true,
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
    lazy = true,
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
    lazy = true,
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
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
  },

  -- LSP

  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
  },
  { "tamago324/nlsp-settings.nvim" },
  { "jose-elias-alvarez/nvim-lsp-ts-utils" },
  { "neovim/nvim-lspconfig" },
  { "ray-x/lsp_signature.nvim" },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup {}
    end,
  },
  { "lvimuser/lsp-inlayhints.nvim" },

  -- SNIPPETS

  -- FORMAT

  { "b0o/SchemaStore.nvim" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
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
