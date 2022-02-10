local keymap = vim.api.nvim_set_keymap
-- For the buffers management
keymap("n", "<C-s>", ":w<CR>", {})
keymap("n", "<C-m>", ":x<CR>", {})
keymap("n", "<C-w>", ":q!<CR>", {})
--terminal
keymap("n", "<Leader>tf", ":ToggleTerm<CR>", {})
keymap("n", "<Leader>tv", ':ToggleTerm direction="vertical"<CR>', {})
keymap("n", "<Leader>th", ':ToggleTerm direction="horizontal"<CR>', {})
--Explorer
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", {})
-- keymap("n", "<Leader>q", ":NvimTreeClose<CR>", {})
--Bufers management
keymap("n", "<Leader>bd", ":Bdelete<CR>", {})
keymap("n", "<Leader>bv", ":vsp<CR>", {})
keymap("n", "<Leader>bh", ":split<CR>", {})
local opts = {
	noremap = true,
}
--Management
keymap("n", "<C-p>", ":bprev<CR>", opts)
keymap("n", "<C-o>", ":bnext<CR>", opts)
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)
keymap("v", "<a-j>", ":m .+1<cr>==", {noremap = true, silent = true})
keymap("v", "<A-k>", ":m .-2<CR>==", {noremap = true, silent = true})
keymap("v", "p", '"_dP', {noremap = true, silent = true})
keymap("x", "J", ":move '>+1<CR>gv-gv", {noremap = true, silent = true})
keymap("x", "K", ":move '<-2<CR>gv-gv", {noremap = true, silent = true})
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", {noremap = true, silent = true})
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", {noremap = true, silent = true})
keymap("n", "<Leader>n", ":nohlsearch<CR>", { silent = true })

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
keymap("n", "<CR>", "<cmd>FineCmdline<CR>", { noremap = true })

vim.cmd([[
nnoremap <F14> :set invpaste paste?<CR>
nnoremap <leader>po <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap <leader>pi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
nnoremap <leader>pc <cmd>lua require('goto-preview').close_all_win()<CR>
"------------------ resize --------------------
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <silent> <right> :vertical resize +5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <up> :vertical resize +5<CR>
nnoremap <silent> <down> :vertical resize -5<CR>
vnoremap <c-r> :split<CR>:term<CR>:resize 10<CR>
tnoremap <Esc> <C-\><C-n>:q!<CR>
"--------------------MOUSE------------------
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction
]])
