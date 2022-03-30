-- --Global options
vim.o.foldlevelstart = 99
vim.o.title = true
vim.o.pastetoggle = "<F14>"
vim.o.compatible = false
vim.o.shiftround = true
vim.o.hidden = true
vim.o.background = "dark"
vim.o.write = true
vim.o.scrolljump = -3
vim.o.fillchars = "eob: "
--Window Local
vim.wo.fdm = "indent"
vim.wo.number = true
vim.wo.cursorline = true
vim.wo.wrap = false
vim.wo.colorcolumn = "120"
vim.wo.rnu = true
-- Buffer Local
vim.bo.autoindent = true
vim.bo.spelllang = "en"
vim.bo.ma = true
--Leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "//"
vim.g.did_load_filetypes = 1
--Others
vim.cmd([[
syntax off
let g:cursorhold_updatetime = 100
]])
local options = {
	backup = false,
  foldmethod = "manual",
	clipboard = "unnamedplus",
	cmdheight = 2,
	completeopt = { "menuone", "noselect" },
	conceallevel = 0,
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	mouse = "a",
	pumheight = 10,
	showmode = false,
	showtabline = 2,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	termguicolors = true,
	timeoutlen = 200,
	undofile = true,
	updatetime = 200,
	writebackup = false,
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	cursorline = true,
	number = false,
	relativenumber = true,
	numberwidth = 4,
	signcolumn = "yes",
	wrap = false,
	scrolloff = 9,
	sidescrolloff = 8,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]])
if vim.fn.has("win32") then
  vim.cmd([[
  let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
  if executable(s:clip)
      augroup WSLYank
          autocmd!
          autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
      augroup END
  endif
  ]])
end
