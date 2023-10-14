local options = {
  backup = false,
  foldmethod = "manual",
  clipboard = "unnamedplus",
  cmdheight = 1,
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = "utf-8",
  hlsearch = true,
  ignorecase = true,
  mousemoveevent = true,
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
  timeoutlen = 500,
  undofile = true,
  updatetime = 100,
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
  ruler = false,
  title = true,
  colorcolumn = "+0",
  showcmd = false,
  guifont = "monospace:h17",
  whichwrap = "bs<>[]hl",
}

vim.opt.shortmess:append "c"
vim.g.mapleader = " "
vim.g.maplocalleader = "//"
vim.g.editorconfig = true

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.listchars:append "space: "
vim.opt.listchars:append "eol: "
vim.opt.fillchars:append {
  stl = " ",
}

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]


vim.cmd [[
  let s:clip = '/mnt/c/Windows/System32/clip.exe'
  if executable(s:clip)
      augroup WSLYank
          autocmd!
          autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
      augroup END
  endif
]]
