return {
  -- COLORSCHEMA

  {
    "Johan-Palacios/onedarker",
    dev = false,
    -- dir = "~/colorines",
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme "onedarker"
    end,
  },

  -- MANAGMENT PLUGINS
  { "folke/lazy.nvim", tag = "stable" },
  { "tweekmonster/startuptime.vim", cmd = "StartupTime", event = "VeryLazy" },
  { "vim-scripts/restore_view.vim", lazy = false, event = "VimEnter", priority = 100 },
  {
    "echasnovski/mini.bufremove",
    version = false,
    opts = {
      silent = false,
    },
    config = true,
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
  },
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
    event = { "VimEnter" },
    config = function()
      require "core.tree"
    end,
  },

  {
    "LunarVim/bigfile.nvim",
    config = true,
    event = { "BufReadPre", "FileReadPre" },
  },

  -- WINBAR

  {
    "SmiteshP/nvim-navic",
    event = { "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
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
    dependencies = { "neovim/nvim-lspconfig" },
  },
}
