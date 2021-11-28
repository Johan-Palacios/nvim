vim.cmd [[
"--------------------LSP------------------
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>lh <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>lp <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <leader>ln <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nmap <leader>lf :Neoformat <CR>
]]
