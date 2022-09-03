local fn = vim.fn

local install_path = fn.stdpath('data') .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  print('Installing packer close and reopen Neovim...')
  print('Instalando packer y reabriendo Neovim')
  vim.cmd([[packadd packer.nvim]])
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

local use = packer.use
vim.cmd([[packadd packer.nvim]])

packer.startup({
  { ... },
  config = {
    compile_path = vim.fn.stdpath('config') .. "/lua/packer_compiled.lua",
  },
})

packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = "rounded" })
    end,
  },
})

return packer.startup(function()


  -- MANAGMENT PLUGINS
  use { 'wbthomason/packer.nvim' }
  use { 'lewis6991/impatient.nvim' }
  use { 'tweekmonster/startuptime.vim' }
  use { 'nathom/filetype.nvim' }
  use { 'antoinemadec/FixCursorHold.nvim' }
  use { 'vim-scripts/restore_view.vim' }
  use { 'moll/vim-bbye' }
  use { 'rcarriga/nvim-notify' }
  use { 'ahmedkhalf/project.nvim' }


  -- GIT

  use { 'lewis6991/gitsigns.nvim' }
  use { 'tpope/vim-fugitive' }
  use { 'akinsho/git-conflict.nvim', tag = "*", config = function()
    require('git-conflict').setup()
  end }


  -- COSTMETICS

  use { 'goolord/alpha-nvim',
    config = function()
      require("core.cosmetics.alpha")
    end }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use { 'akinsho/bufferline.nvim',
    config = function()
      require('core.tools.barbar')
    end,
    event = 'BufWinEnter' }
  use('kyazdani42/nvim-web-devicons')
  use { 'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('core.tools.indent')
    end,
    event = 'BufRead'
  }
  use {
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup({})
    end,
  }


  -- COLORSCHEMA

  use { 'joshdick/onedark.vim',
    config = function()
      vim.cmd('source $HOME/.config/nvim/themes/onedark.vim')
    end }


  -- DEBUGERS

  use { 'mfussenegger/nvim-dap' }
  use { 'rcarriga/nvim-dap-ui',
    requires = 'mfussenegger/nvim-dap' }


  -- SINTAX HIGHLIGHT

  use { 'nvim-treesitter/nvim-treesitter',
    event = { 'BufRead', "BufNewFile", "BufWinEnter" },
    config = function()
      require('core.treesit')
    end,
  }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }
  use { 'RRethy/vim-illuminate' }


  -- MOVEMENT TOOLS

  use { 'andymass/vim-matchup',
    event = 'BufRead', opt = true }
  use { 'tpope/vim-unimpaired' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'windwp/nvim-autopairs' }
  use { 'tpope/vim-surround' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'tpope/vim-sleuth' }
  use {
    'matbme/JABS.nvim'
  }
  use { 'Pocco81/AutoSave.nvim' }
  use { 'nacro90/numb.nvim' }
  use('karb94/neoscroll.nvim')
  use { 'ggandor/lightspeed.nvim' }
  use({
    'folke/which-key.nvim',
    config = function()
      require('core.whichkey')
    end,
    event = 'BufWinEnter'
  })


  -- CODE HELP TOOLS

  use { 'numToStr/Comment.nvim' }
  use({
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('core.tools.info_icons')
    end,
    event = { 'CursorMoved', "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost" }
  })
  use { 'AndrewRadev/tagalong.vim' }
  use { 'alvan/vim-closetag' }
  use { 'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
    config = function()
      require('core.cosmetics.colorizer')
    end }


  -- TERMINAL

  use { 'akinsho/nvim-toggleterm.lua',
    config = function()
      require('core.terminal')
    end }


  -- PROBLEMS NVIM

  use({
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup({})
    end,
  })


  -- TREE

  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('core.tree')
    end
  })


  -- AUTOCOMPLETE

  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'f3fora/cmp-spell' }
  --[[ use { 'zbirenbaum/copilot-cmp' } ]]

  -- LSP

  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { 'tamago324/nlsp-settings.nvim' }
  use { 'jose-elias-alvarez/nvim-lsp-ts-utils' }
  use { 'neovim/nvim-lspconfig' }
  use { 'ray-x/lsp_signature.nvim' }
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      local saga = require("lspsaga")

      saga.init_lsp_saga({
        -- your configuration
      })
    end,
  })
  use { "j-hui/fidget.nvim", config = function()
    require "fidget".setup {}
  end }
  use { "lvimuser/lsp-inlayhints.nvim" }

  use { "b0o/SchemaStore.nvim" }
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

  use { 'L3MON4D3/LuaSnip' }
  use { 'rafamadriz/friendly-snippets' }


  -- FORMAT

  use({
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('null-ls').setup()
    end,
    requires = { 'nvim-lua/plenary.nvim' },
  })
  use { 'editorconfig/editorconfig-vim' }


  -- WINBAR

  use { 'SmiteshP/nvim-navic',
    event = { "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
    config = function()
      require('core.gps')
    end,
    requires = "neovim/nvim-lspconfig"
  }

  -- EXTRA TOOLS

  use { 'simrat39/rust-tools.nvim' }
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
