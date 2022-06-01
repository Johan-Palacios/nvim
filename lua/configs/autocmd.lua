vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
  end,
})

-- NOTE: SPEED
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'TelescopePrompt', 'packer'},
  callback = function()
    vim.opt.laststatus = 0
  end
})

vim.api.nvim_create_autocmd({ "BufWinEnter"}, {
  callback = function()
    local statusline_wintype_excluded = {
      "popup",
    }
    if vim.tbl_contains(statusline_wintype_excluded, vim.fn.win_gettype()) then
      vim.opt.laststatus = 0
    end
  end,
})

vim.cmd "let g:matchup_matchparen_offscreen = {}"

-- NOTE: TREE CUSTOM LINE
vim.api.nvim_create_autocmd('BufEnter', {
  command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
  nested = true,
})

-- NOTE: Configuration of 3 statusline
vim.api.nvim_create_autocmd({ "BufWinLeave", "WinEnter"}, {
  pattern = "*",
  callback = function()
      vim.opt.laststatus = 3
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

vim.api.nvim_create_autocmd({ "CursorMoved", "BufWinEnter", "BufFilePost" }, {
  callback = function()
    local winbar_filetype_exclude = {
      "help",
      "packer",
      "NvimTree",
      "Trouble",
      "alpha",
      "Outline",
      "toggleterm",
    }

    if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
      vim.opt_local.winbar = nil
      return
    end

    local value = require("core.winbar").gps()

    if value == nil then
      value = require("core.winbar").filename()
    end

    vim.opt_local.winbar = value
  end,
})


vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd "quit"
  end,
})
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.cmd "hi link illuminatedWord LspReferenceText"
  end,
})
