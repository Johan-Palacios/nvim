return {
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

  {
    "L3MON4D3/LuaSnip",
    build = (not jit.os:find "Windows")
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
      or nil,
    event = "InsertEnter",
    dependencies = {
      { "rafamadriz/friendly-snippets",  event = "InsertEnter" },
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- LSP
  { "williamboman/mason.nvim" },
  { "lvimuser/lsp-inlayhints.nvim" },
  { "ray-x/lsp_signature.nvim" },

  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
  },
  { "folke/neodev.nvim", config = true },
  {
    "j-hui/fidget.nvim",
    branch = "legacy",
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

  { "tamago324/nlsp-settings.nvim" },
  { "b0o/SchemaStore.nvim" },
  { "jose-elias-alvarez/null-ls.nvim" },
}
