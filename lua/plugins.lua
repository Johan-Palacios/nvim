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
  -- NOTE: PRINCIPAL PLUGINS
  use { 'wbthomason/packer.nvim' }
  use { 'lewis6991/impatient.nvim' }
  use { 'tweekmonster/startuptime.vim' }
  use { 'nathom/filetype.nvim' }
  use { 'antoinemadec/FixCursorHold.nvim' }
  use { 'vim-scripts/restore_view.vim' }
  use { 'moll/vim-bbye' }
  -- NOTE: STYLE PLUGIND
  use { 'goolord/alpha-nvim',
    config = function()
      require("core.cosmetics.alpha")
    end }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use { 'joshdick/onedark.vim',
    config = function()
      vim.cmd('source $HOME/.config/nvim/themes/onedark.vim')
    end }
  use { 'akinsho/bufferline.nvim',
    config = function()
      require('core.tools.barbar')
    end,
    event = 'BufWinEnter' }
  use('kyazdani42/nvim-web-devicons')
  use { 'lewis6991/gitsigns.nvim' }
  use('nvim-lua/popup.nvim')
  use { 'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('core.tools.indent')
    end,
    event = 'BufRead'
  }
  use { 'rcarriga/nvim-notify' }
  -- NOTE: Debuger plugins
  use { 'mfussenegger/nvim-dap' }
  use { 'rcarriga/nvim-dap-ui',
    requires = 'mfussenegger/nvim-dap' }
  use { 'ravenxrz/DAPInstall.nvim' }
  -- External debuger
  -- use {'mfussenegger/nvim-dap-python'}
  use { 'nvim-treesitter/nvim-treesitter',
    event = { 'BufRead', "BufNewFile", "BufWinEnter" },
    config = function()
      require('core.treesit')
    end,
  }
  use { 'nvim-treesitter/playground',
    after = 'nvim-treesitter' }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }
  -- use { 'romgrk/nvim-treesitter-context' }
  -- NOTE: PROYECT MANAGEMENT
  use { 'ahmedkhalf/project.nvim' }
  -- NOTE: Insert mode plugins
  use { 'andymass/vim-matchup',
    event = 'BufRead', opt = true }
  use { 'tpope/vim-unimpaired' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'windwp/nvim-autopairs' }
  use { 'tpope/vim-surround' }
  use {
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup({})
      require('pretty-fold.preview').setup()
    end,
  }
  use {
    'matbme/JABS.nvim'
  }
  -- NOTE: TOOLS
  use { 'numToStr/Comment.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'AndrewRadev/tagalong.vim' }
  use { 'alvan/vim-closetag' }
  use { 'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
    config = function()
      require('core.cosmetics.colorizer')
    end }
  use { 'tpope/vim-fugitive' }
  use { 'zivyangll/git-blame.vim' }
  -- Not works
  -- use('sindrets/diffview.nvim')
  use { 'nacro90/numb.nvim' }
  use { 'Pocco81/AutoSave.nvim' }
  use { 'akinsho/nvim-toggleterm.lua',
    config = function()
      require('core.terminal')
    end }
  use('rhysd/git-messenger.vim')
  use('karb94/neoscroll.nvim')
  use { 'simrat39/symbols-outline.nvim' }
  use({
    'folke/twilight.nvim',
    config = function()
      require('twilight').setup({})
    end,
  })
  use { 'is0n/jaq-nvim' }
  use({
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('core.tools.info_icons')
    end,
    event = { 'CursorMoved', "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost" }
  })
  use({
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup({})
    end,
  })
  use {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {}
    end
  }
  use { 'ggandor/lightspeed.nvim' }
  use { 'RRethy/vim-illuminate' }
  use { 'anuvyklack/nvim-keymap-amend' }
  use({
    'folke/which-key.nvim',
    config = function()
      require('core.whichkey')
    end,
    event = 'BufWinEnter'
  })
  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('core.tree')
    end
  })
  use({
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup({})
    end
  })
  -- NOTE: Autocomplete
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'f3fora/cmp-spell' }
  use { 'neovim/nvim-lspconfig' }
  -- use { "github/copilot.vim" }
  use { 'zbirenbaum/copilot-cmp' }
  use {
    'ray-x/lsp_signature.nvim',
  }
  use {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require "core.copilot"
      end, 100)
    end,
  }
  -- NOTE: Snippets
  use { 'L3MON4D3/LuaSnip' }
  use { 'rafamadriz/friendly-snippets' }
  use { 'williamboman/nvim-lsp-installer' }
  use { 'tamago324/nlsp-settings.nvim' }
  use { 'jose-elias-alvarez/nvim-lsp-ts-utils' }
  use({
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('null-ls').setup()
    end,
    requires = { 'nvim-lua/plenary.nvim' },
  })
  -- NOTE: WINBAR
  use { 'SmiteshP/nvim-navic',
    event = { "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
    config = function()
      require('core.gps')
    end,
    requires = "neovim/nvim-lspconfig"
  }
  -- Custom programing languages
  use { 'simrat39/rust-tools.nvim', branch = "modularize_and_inlay_rewrite" }
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
