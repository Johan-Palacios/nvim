vim.cmd [[
augroup exe_code
  autocmd!
  "Python codes
  autocmd FileType python nnoremap <buffer> <localleader>r
        \ :vsp<CR> :term python3 %<CR> :startinsert<CR>
  "Javascript
  autocmd FileType javascript nnoremap <buffer> <localleader>r
        \ :vsp<CR> :term nodejs %<CR> :startinsert<CR>
"-------------Compile Code and Run code -------------------
"autocmd filetype c nnoremap <leader>r :w <bar> exec "!gcc ".shellescape("%")." -o ".shellescape("%:r")." && ./".shellescape("%:r")<CR>
"autocmd filetype cpp nnoremap <leader>r :w <bar> exec "!g++ ".shellescape("%")." -o ".shellescape("%:r")." && ./".shellescape("%:r")<CR>
"autocmd filetype cs nnoremap <leader>r :w <bar> exec "!mcs ".shellescape("%")." -o ".shellescape("%:r")." && ./".shellescape("%:r")<CR>
map <localleader>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
exec "vsp"
exec "term ./%<"
endfunc
]]
