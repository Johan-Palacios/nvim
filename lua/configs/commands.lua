local keymap = vim.api.nvim_set_keymap
-- For the buffers management
keymap("n", "<C-s>", ":w<CR>", {})
keymap("n", "<C-m>", ":x<CR>", {})
keymap("n", "<C-w>", ":q!<CR>", {})
--terminal
keymap("n", "<Leader>tf", ":ToggleTerm<CR>", {})
keymap("n", "<Leader>tv", ":ToggleTerm direction=\"vertical\"<CR>", {})
keymap("n", "<Leader>th", ":ToggleTerm direction=\"horizontal\"<CR>", {})
--Explorer
keymap("n", "<Leader>e", ":NvimTreeOpen<CR>", {})
keymap("n", "<Leader>q", ":NvimTreeClose<CR>", {})
--Bufers management
keymap("n", "<Leader>bd", ":bd<CR>", {})
local opts = {
    noremap = true
}
--Management
keymap("n", "<C-p>", ":bprev<CR>", opts)
keymap("n", "<C-o>", ":bnext<CR>", opts)
keymap("v", "<Tab>", ">gV", opts)
keymap("v", "<S-Tab>", "<gV", opts)

--Git
keymap("n", "<Leader>gms", ":<C-u>call gitblame#echo()<CR>", opts)
keymap("n", "<Leader>gs", ":G", opts)
keymap("n", "<Leader>gi", ":diffget //2<CR>", opts)
keymap("n", "<Leader>gd", ":diffget //3<CR>", opts)
--Telescope
keymap("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<Leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<Leader>fh", "<cmd>Telescope help_tags<cr>", opts)

vim.cmd [[
nnoremap <silent> <leader>n :nohlsearch<CR>
nnoremap <leader>po <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap <leader>pi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
nnoremap <leader>pc <cmd>lua require('goto-preview').close_all_win()<CR>
]]
