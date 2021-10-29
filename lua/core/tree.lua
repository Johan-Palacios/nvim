
require'nvim-tree'.setup()
-- following options are the default
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = true,
  ignore_ft_on_setup  = {},
  auto_close          = true,
  open_on_tab         = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  hijack_cursor       = false,
  update_cwd          = false,
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },

  view = {
    width = 26,
    side = 'left',
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {
        { key = "<leader>s",                        cb = tree_cb("vsplit") },
      }
    }
  }
}
vim.cmd [[
"-------------- Nvimtree ----------------------
let g:nvim_tree_auto_ignore_ft = ["dashboard"]
let g:indent_blankline_filetype_exclude = ["help", "terminal", "dashboard", "tagbar","NvimTree", "Outline"]
]]
