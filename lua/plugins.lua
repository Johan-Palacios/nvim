local packer = require("packer")
        --Telescope plugs
local use = packer.use

-- using { } for using different branch , loading plugin with certain commands etc
return packer.startup(
    function()
        --Down Line
        use "wbthomason/packer.nvim"
        use "glepnir/galaxyline.nvim"
        use "lewis6991/gitsigns.nvim"
        --Bar
        use "kyazdani42/nvim-web-devicons"
        use "akinsho/nvim-bufferline.lua"
        --Zen mode
        use "Pocco81/TrueZen.nvim"
        --Tressiter
        use "nvim-treesitter/nvim-treesitter"
        use "onsails/lspkind-nvim"
        use 'neovim/nvim-lspconfig'
        use 'hrsh7th/nvim-compe'
        use 'nvim-lua/completion-nvim'


    end
)
