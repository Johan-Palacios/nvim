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
-- --Window Local
vim.wo.fdm = "indent"
vim.wo.cursorline = true
vim.wo.wrap = false
vim.wo.colorcolumn = "120"
vim.wo.rnu = true
-- -- Buffer Local
vim.bo.autoindent = true
vim.bo.spelllang = "en"
vim.bo.ma = true

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
  laststatus = 3,
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = "//"
vim.g.cursorhold_updatetime = 100
vim.g.did_load_filetypes = 1
vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]])

if vim.fn.has("wsl") == 1 then
  vim.cmd([[
  let s:clip = '/mnt/c/Windows/System32/clip.exe'
  if executable(s:clip)
      augroup WSLYank
          autocmd!
          autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
      augroup END
  endif
  ]])
end
