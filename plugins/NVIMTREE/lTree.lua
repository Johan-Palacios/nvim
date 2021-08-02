local tree_cb = require "nvim-tree.config".nvim_tree_callback
vim.g.nvim_tree_bindings = {{key = "<C-s>", cb = tree_cb("vsplit")}}
