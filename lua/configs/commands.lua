local keymap = vim.api.nvim_set_keymap
--Explorer
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", {})
--Bufers management
keymap("n", "<Leader>bd", ":Bdelete<CR>", {})
keymap("n", "<C-s>", ":vsp<CR>", {})
keymap("n", "<Leader>bh", ":split<CR>", {})
local opts = {
  noremap = true,
}
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)
keymap("v", "<a-j>", ":m .+1<cr>==", { noremap = true, silent = true })
keymap("v", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
keymap("v", "p", '"_dP', { noremap = true, silent = true })
keymap("x", "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
keymap("x", "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
keymap("n", "<Leader>n", ":nohlsearch<CR>", { silent = true })
--Git
keymap("n", "<Leader>gms", ":<C-u>call gitblame#echo()<CR>", opts)
keymap("n", "<Leader>gs", ":G", opts)
keymap("n", "<Leader>gi", ":diffget //2<CR>", opts)
keymap("n", "<Leader>gd", ":diffget //3<CR>", opts)
--Telescope
keymap("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<Leader>fw", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<Leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<Leader>fh", "<cmd>Telescope help_tags<cr>", opts)
-- keymap("n", "<cr>", "<cmd>FineCmdline<CR>", { noremap = true })
keymap("n", "<Leader>j", ":JABSOpen<cr>", { noremap = true, silent = true, nowait = true })
keymap("n", "<Leader>x", ":Jaq toggleterm<cr>", opts)
keymap("n", "<Leader>po", ":lua require('goto-preview').goto_preview_definition()<CR>", opts)
keymap("n", "<Leader>pi", ":lua require('goto-preview').goto_preview_implementation()<CR>", opts)
keymap("n", "<Leader>pc", ":lua require('goto-preview').close_all_win()<CR>", opts)
keymap("n", "<F14>", ":set invpaste paste?<CR>", opts)
keymap(
  "n",
  "<C-p>",
  "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
  opts
)
-- resize
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts) keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- terminal
vim.cmd([[
tnoremap <Esc> <C-\><C-n>:q!<CR>
]])
keymap("n", "<Leader>tf", ":ToggleTerm<CR>", {})
keymap("n", "<Leader>tv", ':ToggleTerm direction="vertical"<CR>', {})
keymap("n", "<Leader>th", ':ToggleTerm direction="horizontal"<CR>', {})
