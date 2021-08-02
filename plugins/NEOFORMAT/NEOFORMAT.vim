"---------------------Neoformat-------------------
autocmd BufWritePre *.js :Neoformat
autocmd BufWritePre *.json :Neoformat
autocmd BufWritePre *.html :Neoformat
autocmd BufWritePre *.css :Neoformat
autocmd BufWritePre *.ts :Neoformat
autocmd BufWritePre *.scss :Neoformat
autocmd BufWritePre *.c :Neoformat
autocmd BufWritePre *.cpp :Neoformat
" autocmd BufWritePre *.cs :Neoformat
autocmd BufWritePre *.cs :OmniSharpCodeFormat
autocmd BufWritePre *.py :Neoformat
autocmd BufWritePre *.lua :Neoformat
" let g:neoformat_run_all_formatters = 1
