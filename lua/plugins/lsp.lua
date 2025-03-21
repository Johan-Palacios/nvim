return {

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
        branch = "main",
        opts = {
          progress = {
            poll_rate = 0,
            suppress_on_insert = true,
            ignore_done_already = true,
            ignore_empty_message = false,
            display = {
              progress_icon = { pattern = "dots", period = 1 },
            },
          },
          notification = {
            window = {
              normal_hl = "Comment", -- Base highlight group in the notification window
              winblend = 1, -- Background color opacity in the notification window
              border = "none", -- Border around the notification window
              zindex = 45, -- Stacking priority of the notification window
              max_width = 0, -- Maximum width of the notification window
              max_height = 0, -- Maximum height of the notification window
              x_padding = 1, -- Padding from right edge of window boundary
              y_padding = 0, -- Padding from bottom edge of window boundary
              align = "bottom", -- How to align the notification window
              relative = "editor", -- What the notification window position is relative to
            },
          },

          integration = {
            ["nvim-tree"] = {
              enable = true,
            },
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
    end,
  },

  {
    "williamboman/mason.nvim",
    dependencies = {
      { "williamboman/mason-lspconfig.nvim" },
      "neovim/nvim-lspconfig",
    },
    config = function()
      local status_ok, mason = pcall(require, "mason")
      if not status_ok then
        return
      end

      local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
      if not status_ok_1 then
        return
      end

      local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
      if not lspconfig_status_ok then
        return
      end

      local servers = {
        "eslint",
        "emmet_language_server",
        "astro",
        -- "tsserver",
        "dockerls",
        "jsonls",
        "yamlls",
        "bashls",
        "lua_ls",
        "pyright",
        "html",
        "cssls",
        "vimls",
        "rust_analyzer",
        -- "cmake",
        "clangd",
        "tailwindcss",
        "lemminx",
        "taplo",
        "texlab",
      }

      local settings = {
        ui = {
          border = "rounded",
          icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
          },
        },
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4,
      }

      mason.setup(settings)
      mason_lspconfig.setup {
        ensure_installed = servers,
        automatic_installation = true,
      }

      for _, server in pairs(servers) do
        local opts = {
          on_attach = require("lsp.handler").on_attach,
          capabilities = require("lsp.handler").capabilities,
        }
        local has_custom_opts, server_custom_opts = pcall(require, "lsp.settings." .. server)
        if has_custom_opts then
          opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
        end
        lspconfig[server].setup(opts)
      end
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
          "markdown",
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

  {
    "SmiteshP/nvim-navic",
    event = { "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
    dependencies = { "neovim/nvim-lspconfig", "nvim-tree/nvim-web-devicons" },
    lazy = true,
    config = function()
      require "core.navic"
      local create_winbar = function()
        vim.api.nvim_create_augroup("_winbar", {})
        if vim.fn.has "nvim-0.8" == 1 then
          vim.api.nvim_create_autocmd(
            { "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
            {
              group = "_winbar",
              callback = function()
                local status_ok, _ = pcall(vim.api.nvim_buf_get_var, 0, "lsp_floating_window")
                if not status_ok then
                  require("core.winbar").get_winbar()
                end
              end,
            }
          )
        end
      end

      create_winbar()
    end,
  },
}
