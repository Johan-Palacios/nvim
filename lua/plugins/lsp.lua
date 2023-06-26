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
      { "rafamadriz/friendly-snippets", event = "InsertEnter" },
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- LSP

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason.nvim" },
      { "tamago324/nlsp-settings.nvim" },
      { "b0o/SchemaStore.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      {
        "folke/neodev.nvim",
        opts = {},
      },
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
    },
    config = function()
      local status_ok, _ = pcall(require, "lspconfig")
      if not status_ok then
        return
      end

      require("lsp.handler").setup()
      require "lsp.mason"
    end,
  },

  -- LspDecorators
  {
    "ray-x/lsp_signature.nvim",
    event = { "VeryLazy" },
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      local status_ok, signature = pcall(require, "lsp_signature")
      if not status_ok then
        return
      end

      local icons = require "core.icons"

      local cfg = {
        debug = false,
        log_path = "debug_log_file_path",
        verbose = false,
        bind = true,
        doc_lines = 0,
        floating_window = false,
        floating_window_above_cur_line = false,
        fix_pos = false,
        hint_enable = true,
        hint_prefix = icons.diagnostics.Hint .. " ",
        hint_scheme = "Function",
        hi_parameter = "LspSignatureActiveParameter",
        max_height = 12,
        max_width = 120,
        handler_opts = {
          border = "rounded",
        },
        always_trigger = false,
        auto_close_after = nil,
        extra_trigger_chars = {},
        zindex = 200,
        padding = "",
        transparency = nil,
        shadow_blend = 36,
        shadow_guibg = "Black",
        timer_interval = 200,
        toggle_key = nil,
      }
      signature.setup(cfg)
      signature.on_attach(cfg)
    end,
  },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("illuminate").configure {
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        delay = 120,
        filetypes_denylist = {
          "gitcommit",
          "dirvish",
          "fugitive",
          "alpha",
          "NvimTree",
          "packer",
          "manson",
          "neogitstatus",
          "Trouble",
          "lir",
          "Outline",
          "spectre_panel",
          "toggleterm",
          "DressingSelect",
          "TelescopePrompt",
          "sagacodeaction",
          "dapui_console",
          "dapui_watches",
          "dapui_stacks",
          "dapui_breakpoints",
          "dapui_scopes",
          "lspsagafinder",
          "JABSwindow",
          "lspsagaoutline",
          "lazy",
          "help",
          "DressingInput",
          "",
        },
        filetypes_allowlist = {},
        modes_denylist = { "v", "i" },
        modes_allowlist = {},
        providers_regex_syntax_denylist = {},
        providers_regex_syntax_allowlist = {},
        under_cursor = true,
      }
    end,
  },
}
