vim.cmd [[
nnoremap <F14> :set invpaste paste?<CR>
highlight pmenu ctermbg=DarkGray guibg=onedark 
"--------------------Execute codes ---------
augroup exe_code
  autocmd!
  "Python codes
  autocmd FileType python nnoremap <buffer> <localleader>r
        \ :vsp<CR> :term python3 %<CR> :startinsert<CR>
  "Javascript
  autocmd FileType javascript nnoremap <buffer> <localleader>r
        \ :vsp<CR> :term nodejs %<CR> :startinsert<CR>
"-------------Compile Code and Run code -------------------
autocmd filetype c nnoremap <leader>r :w <bar> exec "!gcc ".shellescape("%")." -o ".shellescape("%:r")." && ./".shellescape("%:r")<CR>
autocmd filetype cpp nnoremap <leader>r :w <bar> exec "!g++ ".shellescape("%")." -o ".shellescape("%:r")." && ./".shellescape("%:r")<CR>
"autocmd filetype cs nnoremap <leader>r :w <bar> exec "!mcs ".shellescape("%")." -o ".shellescape("%:r")." && ./".shellescape("%:r")<CR>
map <localleader>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
exec "vsp"
exec "term ./%<"
endfunc
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
"Tab trigger 
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
]]
