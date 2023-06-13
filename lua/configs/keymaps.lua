local keymap = vim.api.nvim_set_keymap
local opts = {
  noremap = true,
  silent = true,
}
--Explorer
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)
--Bufers management
vim.keymap.set("n", "<leader>bd", function()
  vim.cmd ":bdelete"
end, opts)
keymap("n", "<C-s>", ":vsp<CR>", {})
keymap("n", "<Leader>bh", ":split<CR>", {})
keymap("n", "<C-k>", "<C-w>k", opts)
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- Movements
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)
keymap("v", "<a-j>", ":m .+1<cr>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("n", "<Leader>n", ":nohlsearch<CR>", { silent = true })
--Git
keymap("n", "<leader>go", "<Plug>(git-conflict-ours)", opts)
keymap("n", "<leader>gb", "<Plug>(git-conflict-both)", opts)
keymap("n", "<leader>gt", "<Plug>(git-conflict-theirs)", opts)
keymap("n", "<leader>g0", "<Plug>(git-conflict-none)", opts)
keymap("n", "<leader>gp", "<Plug>(git-conflict-prev-conflict)", opts)
keymap("n", "<leader>gn", "<Plug>(git-conflict-next-conflict)", opts)
--Jabs
keymap("n", "<Leader>j", ":JABSOpen<cr>", { noremap = true, silent = true, nowait = true })
-- Resize
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Terminal
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

local show_documentation = function()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand "<cword>")
    -- elseif vim.fn.expand "%:t" == "Cargo.toml" then
    -- Install crates
    -- require("crates").show_popup()
  else
    vim.lsp.buf.hover()
  end
end

vim.keymap.set("n", "K", show_documentation, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Git Terminal
