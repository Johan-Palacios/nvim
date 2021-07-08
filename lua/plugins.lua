local packer = require("packer")

local use = packer.use

-- using { } for using different branch , loading plugin with certain commands etc
return packer.startup(
    function()
        --Down Line
        use "wbthomason/packer.nvim"
        use "glepnir/galaxyline.nvim"
        use "lewis6991/gitsigns.nvim"
        --Tree
        use "kyazdani42/nvim-tree.lua"
        --Bar
        use "kyazdani42/nvim-web-devicons"
        use "akinsho/nvim-bufferline.lua"
        use "onsails/lspkind-nvim"
        --Zen mode
        use "Pocco81/TrueZen.nvim"
        --Tressiter
        use "nvim-treesitter/nvim-treesitter"
        use "neovim/nvim-lspconfig"
        use "hrsh7th/nvim-compe"
        use "nvim-lua/completion-nvim"
        --Show numbers
        use "nacro90/numb.nvim"
        --Indent line
        use {
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
            setup = function()
                require("misc-utils").blankline()
            end
        }
        --Start up
        use {"tweekmonster/startuptime.vim", cmd = "StartupTime"}
        -- Autosave
        use "Pocco81/AutoSave.nvim"
        -- Install languages server
        use "kabouzeid/nvim-lspinstall"
    end
)
