local packer = require("packer")
local use = packer.use
-- using { } for using different branch , loading plugin with certain commands etc
packer.startup {
    {...},
    config = {
        compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua"
    }
}

return packer.startup(
    function()
        --Down Line
        use "wbthomason/packer.nvim"
        use "glepnir/galaxyline.nvim"
        use "lewis6991/gitsigns.nvim"
        use "lewis6991/impatient.nvim"
        --Tree
        use "kyazdani42/nvim-tree.lua"
        --Bar
        use "kyazdani42/nvim-web-devicons"
        use "akinsho/nvim-bufferline.lua"
        use "onsails/lspkind-nvim"
        use "hrsh7th/vim-vsnip"
        use "hrsh7th/vim-vsnip-integ"
        --Zen mode
        use {
            "folke/zen-mode.nvim",
            config = function()
                require("zen-mode").setup {}
            end
        }
        --Tressiter
        use "nvim-treesitter/nvim-treesitter"
        --Autocomplete
        use "neovim/nvim-lspconfig"
        use "hrsh7th/nvim-compe"
        use "L3MON4D3/LuaSnip"
        use "rafamadriz/friendly-snippets"
        use "alvan/vim-closetag"
        --Show numbers
        use "nacro90/numb.nvim"
        --Indent line
        use "lukas-reineke/indent-blankline.nvim"
        --Start up
        use "tweekmonster/startuptime.vim"
        -- Autosave
        use "Pocco81/AutoSave.nvim"
        -- Install languages server
        use "kabouzeid/nvim-lspinstall"
        --Terminal
        use "akinsho/nvim-toggleterm.lua"
        --git
        use "rhysd/git-messenger.vim"
        -- Lua
        use {
            "folke/twilight.nvim",
            config = function()
                require("twilight").setup {}
            end
        }
        use {
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup {}
            end
        }
        use {
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("trouble").setup {}
            end
        }
        use {
            "rmagatti/goto-preview",
            config = function()
                require("goto-preview").setup {}
            end
        }
    end
)
