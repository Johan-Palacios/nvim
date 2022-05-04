local status_ok, tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local g = vim.g

g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

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
tree.setup()
local tree_cb = require("nvim-tree.config").nvim_tree_callback

tree.setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = { "dashboard" },
  open_on_tab = false,
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
    hide_root_folder = true,
    side = "left",
    number = false,
    relativenumber = false,
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
})
vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_1' . tabpagenr() | quit | endif")
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*" },
  nested = true,
  callback = function()
    if vim.fn.winnr "$" == 1 and vim.fn.bufname() == "NvimTree_1" .. vim.fn.tabpagenr() then
      vim.api.nvim_command ":silent qa!"
    end
  end,
})
