--Global options
vim.o.encoding = "utf-8"
vim.o.showtabline = 2
vim.o.foldlevelstart = 99
vim.o.cmdheight = 2
vim.o.title = true
vim.o.splitright= true
vim.o.splitbelow = true
vim.o.mouse = "a"
vim.o.pastetoggle = "<F14>"
vim.o.showmode = true
vim.o.compatible = false
vim.o.shiftround = true
vim.o.hidden = true
vim.o.smartcase = true
vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.write = true
vim.o.scrolloff = 9
vim.o.scrolljump = -3
vim.o.timeoutlen = 500
vim.o.ttimeoutlen = 0
vim.o.updatetime = 100
--Window Local
vim.wo.fdm = "indent"
vim.wo.number = true
vim.wo.cursorline = true
vim.wo.wrap = false
vim.wo.colorcolumn = "120"
vim.wo.rnu = true
-- Buffer Local
vim.bo.autoindent = true
vim.bo.tabstop = 2
vim.bo.shiftwidth = 4
vim.bo.expandtab = true
vim.bo.spelllang = "en"
vim.bo.ma = true
--Leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "//"
--Others
vim.cmd [[
set clipboard+=unnamedplus
filetype on
filetype plugin on
filetype plugin indent on
set completeopt=menu,menuone,noselect
]]
