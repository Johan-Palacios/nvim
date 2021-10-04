require("plugins")

local g = vim.g

require "pg-lspkind/init"

require "core/tools/comment"

require "core/tools/trouble"

require "core/tools/scroll"

require "pg-nvimtree/init"

require "core/cmp"

require "pg-nvimtree/treecomands"

require "pg-statusline/init"

require "gitsigns/gitsigns"

require "pg-luasnip/init"

require "pg-luasnip/config"

require "pg-gotoprev/init"

require "pg-fileicon/init"

require "pg-treesiter/init"

require "lsp/init"

require "pg-numb/init"

require "pg-autosave/init"

require "pg-installsp/init"

require "pg-terminal/init"

-- vim.api.nvim_exec(
-- a%d
--     [[
--    au BufEnter term://* setlocal nonumber
--    au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
--    au BufEnter term://* set laststatus=0
-- ]]
--     false
-- )
--
-- local M = {}
-- function M.is_buffer_empty()
--     return vim.fn.empty(vim.fn.expand("%:t")) == 1
-- end
-- function M.has_width_gt(cols)
--     return vim.fn.winwidth(0) / 2 > cols
-- end
--
-- return M
