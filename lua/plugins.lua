local fn = vim.fn

-- Automatically install packer
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
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local packer = require("packer")
local use = packer.use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end
vim.cmd [[packadd packer.nvim]]
-- using { } for using different branch , loading plugin with certain commands etc
packer.startup {
    {...},
    config = {
        compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua"
    }
}

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function()
    use "wbthomason/packer.nvim"
    use "lewis6991/impatient.nvim"
    use 'antoinemadec/FixCursorHold.nvim'
    use "tweekmonster/startuptime.vim"
    use "nathom/filetype.nvim"
    --Style
    use 'glepnir/dashboard-nvim'
    use "glepnir/galaxyline.nvim"
    use 'joshdick/onedark.vim'
    use 'romgrk/barbar.nvim'
    use "kyazdani42/nvim-web-devicons"
    use {
        'VonHeikemen/fine-cmdline.nvim',
        requires = {
            {'MunifTanjim/nui.nvim'}
        }
    }
    --Mappings and others
    use 'andymass/vim-matchup'
    use 'moll/vim-bbye'
    use 'tpope/vim-unimpaired'
    use 'nvim-lua/plenary.nvim'
    use 'editorconfig/editorconfig-vim'
    use 'nvim-lua/popup.nvim'
    use "windwp/nvim-autopairs"
    use 'sheerun/vim-polyglot'
    use 'sbdchd/neoformat'
    --Tmux
    use 'benmills/vimux'
    use 'christoomey/vim-tmux-navigator'
    -- Tools plugins
    use 'preservim/nerdcommenter'
    use 'nvim-telescope/telescope.nvim'
    use 'OmniSharp/omnisharp-vim'
    use 'kristijanhusak/vim-carbon-now-sh'
    use {
        "folke/which-key.nvim",
        config = function() require("which-key").setup {} end
    }
    -- "Html, css and js
    use "AndrewRadev/tagalong.vim"
    use "alvan/vim-closetag"
    use 'norcalli/nvim-colorizer.lua'
    -- "Git
    use 'tpope/vim-fugitive'
    use 'zivyangll/git-blame.vim'
    use 'sindrets/diffview.nvim'
    use "lewis6991/gitsigns.nvim"
    -- CMP
    use 'hrsh7th/nvim-cmp'
    -- Cmo Extensions
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'saadparwaiz1/cmp_luasnip'
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"
    use "f3fora/cmp-spell"
    -- Tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup {} end
    }
    -- Zen mode
    use {
        "folke/zen-mode.nvim",
        config = function() require("zen-mode").setup {} end
    }
    -- Tressiter
    use "nvim-treesitter/nvim-treesitter"
    use 'nvim-treesitter/playground'
    -- Autocomplete
    use "neovim/nvim-lspconfig"
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"
    -- Show numbers
    use "nacro90/numb.nvim"
    -- Indent line
    use "lukas-reineke/indent-blankline.nvim"
    -- Autosave
    use "Pocco81/AutoSave.nvim"
    -- Install languages server
    use "williamboman/nvim-lsp-installer"
    use "tamago324/nlsp-settings.nvim"
    use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        require("null-ls").setup()
    end,
    requires = { "nvim-lua/plenary.nvim" },
})
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    -- Terminal
    use "akinsho/nvim-toggleterm.lua"
    -- git
    use "rhysd/git-messenger.vim"
    -- Lua
    use {
        "folke/twilight.nvim",
        config = function() require("twilight").setup {} end
    }
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function() require("todo-comments").setup {} end
    }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function() require("trouble").setup {} end
    }
    use {
        "rmagatti/goto-preview",
        config = function() require("goto-preview").setup {} end
    }
    -- Move well
    use 'karb94/neoscroll.nvim'
    -- Show parameters
    use 'simrat39/symbols-outline.nvim'
    use 'ggandor/lightspeed.nvim'

    if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
