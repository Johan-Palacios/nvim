local packer = require("packer")
local use = packer.use
vim.cmd [[packadd packer.nvim]]
-- using { } for using different branch , loading plugin with certain commands etc
packer.startup {
    {...},
    config = {
        compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua"
    }
}
return packer.startup(function()
    use "wbthomason/packer.nvim"
    use "lewis6991/impatient.nvim"
    --Style
    use 'glepnir/dashboard-nvim'
    use "glepnir/galaxyline.nvim"
    use 'joshdick/onedark.vim'
    use 'romgrk/barbar.nvim'
    use "kyazdani42/nvim-web-devicons"
    --Mappings and others
    use 'tpope/vim-repeat'
    use 'andymass/vim-matchup'
    use 'tpope/vim-unimpaired'
    use 'nvim-lua/plenary.nvim'
    use 'editorconfig/editorconfig-vim'
    use 'nvim-lua/popup.nvim'
    use 'jiangmiao/auto-pairs'
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
    use "kabouzeid/nvim-lspinstall"
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
end)
