local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  print "Instalando packer y reabriendo Neovim"
  vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

local use = packer.use
vim.cmd [[packadd packer.nvim]]

packer.startup {
  { ... },
  config = {
    compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
  },
}

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  prompt_border = "rounded",
}

return packer.startup(function()
  -- COLORSCHEMA

  use {
    "joshdick/onedark.vim",
    config = function()
      require "core.colors.theme"
    end,
  }

  -- MANAGMENT PLUGINS
  use { "wbthomason/packer.nvim" }
  use { "lewis6991/impatient.nvim" }
  use { "tweekmonster/startuptime.vim" }
  use { "antoinemadec/FixCursorHold.nvim" }
  use { "vim-scripts/restore_view.vim" }
  use { "moll/vim-bbye" }
  use { "rcarriga/nvim-notify" }
  use { "ahmedkhalf/project.nvim" }

  -- GIT

  use {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      require "core.lazy_plugins.gitsigns"
    end,
  }
  use { "tpope/vim-fugitive" }
  use {
    "akinsho/git-conflict.nvim",
    config = function()
      require("git-conflict").setup()
    end,
  }

  -- COSTMETICS

  use {
    "goolord/alpha-nvim",
  }
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  }
  use {
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    tag = "v3.*",
  }
  use { "kyazdani42/nvim-web-devicons" }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "core.tools.indent"
    end,
    event = "BufRead",
  }
  use {
    "anuvyklack/pretty-fold.nvim",
    config = function()
      require("pretty-fold").setup {}
    end,
  }

  -- DEBUGERS

  use { "mfussenegger/nvim-dap" }
  use { "rcarriga/nvim-dap-ui", requires = "mfussenegger/nvim-dap" }

  -- SINTAX HIGHLIGHT

  use {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile", "BufWinEnter" },
    config = function()
      require "core.treesiter"
    end,
    run = ":TSUpdate",
  }
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
  }
  use { "RRethy/vim-illuminate" }
  use { "p00f/nvim-ts-rainbow" }

  -- MOVEMENT TOOLS

  use { "andymass/vim-matchup", event = "BufRead", opt = true }
  use { "tpope/vim-unimpaired" }
  use { "nvim-lua/plenary.nvim" }
  use { "windwp/nvim-autopairs" }
  use { "tpope/vim-surround" }
  use { "nvim-telescope/telescope.nvim" }
  use { "matbme/JABS.nvim" }
  use { "Pocco81/AutoSave.nvim" }
  use { "nacro90/numb.nvim" }
  use {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end,
  }
  use {
    "ggandor/leap.nvim",
    config = function()
      vim.keymap.set({ "n" }, "s", "<Plug>(leap-forward-to)")
      vim.keymap.set({ "n" }, "S", "<Plug>(leap-backward-to)")
    end,
  }
  use {
    "folke/which-key.nvim",
  }

  -- CODE HELP TOOLS

  use {
    "numToStr/Comment.nvim",
    config = function()
      require "core.lazy_plugins.comment"
    end,
    event = "BufRead",
  }
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }
  use { "AndrewRadev/tagalong.vim" }
  use { "alvan/vim-closetag" }
  use {
    "NvChad/nvim-colorizer.lua",
  }

  -- TERMINAL

  use {
    "akinsho/nvim-toggleterm.lua",
  }

  -- PROBLEMS NVIM

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require "core.tools.trouble"
    end,
  }

  -- TREE

  use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require "core.tree"
    end,
  }

  -- AUTOCOMPLETE

  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }
  use { "saadparwaiz1/cmp_luasnip" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-nvim-lua" }
  use { "f3fora/cmp-spell" }
  --[[ use { 'zbirenbaum/copilot-cmp' } ]]

  -- LSP

  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "tamago324/nlsp-settings.nvim" }
  use { "jose-elias-alvarez/nvim-lsp-ts-utils" }
  use { "neovim/nvim-lspconfig" }
  use { "ray-x/lsp_signature.nvim" }
  use {
    "glepnir/lspsaga.nvim",
    branch = "main",
  }
  use {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup {}
    end,
  }
  use { "lvimuser/lsp-inlayhints.nvim" }
  use { "onsails/lspkind.nvim" }
  --[[ use { ]]
  --[[   "zbirenbaum/copilot.lua", ]]
  --[[   event = { "VimEnter" }, ]]
  --[[   config = function() ]]
  --[[     vim.defer_fn(function() ]]
  --[[       require "core.copilot" ]]
  --[[     end, 100) ]]
  --[[   end, ]]
  --[[ } ]]

  -- SNIPPETS

  use { "L3MON4D3/LuaSnip" }
  use { "rafamadriz/friendly-snippets" }

  -- FORMAT

  -- use { "tpope/vim-sleuth" }
  use { "b0o/SchemaStore.nvim" }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }
  use { "editorconfig/editorconfig-vim" }

  -- WINBAR

  use {
    "SmiteshP/nvim-navic",
    event = { "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
    config = function()
      require "core.gps"
    end,
    requires = "neovim/nvim-lspconfig",
  }

  -- LANGUAGE TOOLS

  use { "simrat39/rust-tools.nvim" }
  use { "mfussenegger/nvim-jdtls" }
  use { "p00f/clangd_extensions.nvim" }
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
