local packer = require("packer")
local use  = packer.use
-- using { } for using different branch , loading plugin with certain commands etc
packer.startup {
    {...},
    config = {
        compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua"
    }
}
return packer.startup(
    function()
        -- Esencial plugin
        use 'tpope/vim-unimpaired'
        use 'liuchengxu/vim-which-key'
        use 'benmills/vimux'
        use 'christoomey/vim-tmux-navigator'
        use 'janko-m/vim-test'
        use 'terryma/vim-multiple-cursors'
        use 'editorconfig/editorconfig-vim'
        use 'easymotion/vim-easymotion'
        use 'preservim/nerdcommenter'
        use 'tpope/vim-repeat'
        use 'andymass/vim-matchup'
        use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'
        use 'nvim-telescope/telescope.nvim'
        use 'glepnir/dashboard-nvim'
        use 'OmniSharp/omnisharp-vim'
        use 'turbio/bracey.vim'
        use 'lilydjwg/colorizer'
        -- "Html, css and js
        use 'mattn/emmet-vim'
        -- "Git
        use 'tpope/vim-fugitive'
        use 'zivyangll/git-blame.vim'
        -- "Files
        use 'junegunn/fzf'
        use 'junegunn/fzf.vim'
        use 'kristijanhusak/vim-carbon-now-sh'
        -- "Sintax and pairs
        use 'jiangmiao/auto-pairs'
        use 'sheerun/vim-polyglot'
        use 'sbdchd/neoformat'
        -- "Themes
        use 'joshdick/onedark.vim'
        use 'romgrk/barbar.nvim'
        use 'ryanoasis/vim-devicons'
        --Down Line
        use  "wbthomason/packer.nvim"
        use  "glepnir/galaxyline.nvim"
        use  "lewis6991/gitsigns.nvim"
        use  "lewis6991/impatient.nvim"
        -- CMP
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/nvim-cmp'
        use 'saadparwaiz1/cmp_luasnip'
        --Tree
        use  {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup {
        } end
        }
        --Bar
        use  "kyazdani42/nvim-web-devicons"
        use  "akinsho/nvim-bufferline.lua"
        use  "onsails/lspkind-nvim"
        --Zen mode
        use  {
            "folke/zen-mode.nvim",
            config = function()
                require("zen-mode").setup {}
            end
        }
        --Tressiter
        use  "nvim-treesitter/nvim-treesitter"
        --Autocomplete
        use  "neovim/nvim-lspconfig"
        -- use  "hrsh7th/nvim-compe"
        use  "L3MON4D3/LuaSnip"
        use  "rafamadriz/friendly-snippets"
        use  "alvan/vim-closetag"
        --Show numbers
        use  "nacro90/numb.nvim"
        --Indent line
        use  "lukas-reineke/indent-blankline.nvim"
        --Start up
        use  "tweekmonster/startuptime.vim"
        -- Autosave
        use  "Pocco81/AutoSave.nvim"
        -- Install languages server
        use  "kabouzeid/nvim-lspinstall"
        --Terminal
        use  "akinsho/nvim-toggleterm.lua"
        --git
        use  "rhysd/git-messenger.vim"
        -- Lua
        use  {
            "folke/twilight.nvim",
            config = function()
                require("twilight").setup {}
            end
        }
        use  {
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup {}
            end
        }
        use  {
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("trouble").setup {}
            end
        }
        use  {
            "rmagatti/goto-preview",
            config = function()
                require("goto-preview").setup {}
            end
        }
        -- Move well
        use 'karb94/neoscroll.nvim'
        -- Show parameters
        use 'simrat39/symbols-outline.nvim'
    end
)
