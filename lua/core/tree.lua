vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "",
		staged = "S",
		unmerged = "",
		renamed = "➜",
		deleted = "",
		untracked = "U",
		ignored = "◌",
	},
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
	},
}
require("nvim-tree").setup()
local tree_cb = require("nvim-tree.config").nvim_tree_callback

require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = { "dashboard" },
    -- auto_open = false,
    open_on_tab = false,
    update_to_buf_dir = {
        enable = true,
        auto_open = true,
    },
    hijack_cursor = false,
    update_cwd = false,
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    system_open = {
        cmd = nil,
        args = {},
    },
    filters = {
        dotfiles = false,
        custom = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 26,
        side = "left",
        number = false,
        relativenumber = false,
        auto_resize = true,
        mappings = {
        custom_only = false,
        list = {
            { key = "v", cb = tree_cb("vsplit") },
        },
        },
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    quit_on_open = 0,
    git_hl = 1,
    disable_window_picker = 0,
    root_folder_modifier = ":t",
    show_icons = {
        git = 1,
        folders = 1,
        files = 1,
        folder_arrows = 1,
        tree_width = 30,
    },
})
