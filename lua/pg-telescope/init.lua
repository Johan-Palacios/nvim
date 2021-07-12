local actions = require("telescope.actions")
require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                ["<C-s>"] = actions.select_vertical
            }
        }
    }
}
