local packer = require("packer")
local use = packer.use

-- using { } for using different branch , loading plugin with certain commands etc
return packer.startup(
    function()
        use "wbthomason/packer.nvim"
        use "glepnir/galaxyline.nvim"
        use "lewis6991/gitsigns.nvim"
    end
)
