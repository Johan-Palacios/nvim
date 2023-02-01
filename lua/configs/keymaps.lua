local keymap = vim.api.nvim_set_keymap
local opts = {
  noremap = true,
  silent = true,
}
--Explorer
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)
--Bufers management
keymap("n", "<Leader>bd", ":Bdelete<CR>", opts)
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
-- Dap
keymap("n", "<Leader>do", ":lua require('dapui').open()<CR>", opts)
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
-- Resize
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Terminal
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap("n", "<Leader>tf", ":ToggleTerm<CR>", {})
keymap("n", "<Leader>tv", ':ToggleTerm direction="vertical"<CR>', opts)
keymap("n", "<Leader>th", ':ToggleTerm direction="horizontal"<CR>', opts)

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
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new { cmd = "lazygit", hidden = true }

local function _lazygit_toggle()
  lazygit:toggle()
end

vim.keymap.set("n", "<leader>tg", function()
  _lazygit_toggle()
end, { noremap = true, silent = true })
