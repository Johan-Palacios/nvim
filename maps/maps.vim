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
autocmd filetype c nnoremap <F21> :w <bar> exec "!gcc ".shellescape("%")." -o ".shellescape("%:r")." && ./".shellescape("%:r")<CR>
autocmd filetype cpp nnoremap <F21> :w <bar> exec "!g++ ".shellescape("%")." -o ".shellescape("%:r")." && ./".shellescape("%:r")<CR>
autocmd filetype cs nnoremap <F21> :w <bar> exec "!mcs ".shellescape("%")." -o ".shellescape("%:r")." && ./".shellescape("%:r")<CR>
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
"--------------------Terminal------------------
vnoremap <c-r> :split<CR>:term<CR>:resize 10<CR>
nnoremap <c-r> :split<CR>:term<CR>:resize 10<CR>
tnoremap <Esc> <C-\><C-n>:q!<CR>

nmap <Leader>tf :ToggleTerm<CR>
nmap <Leader>tv :ToggleTerm direction="vertical"<CR>
nmap <Leader>th :ToggleTerm size=10 direction="horizontal"<CR>
"Find words
" nmap <Leader>ag :Ag<CR>
"Tab trigger 
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"Personal Comands
nmap <leader>e :NvimTreeOpen<CR>
nmap <leader>q :NvimTreeClose<CR>
nmap <C-s> :w<CR>
nmap <C-m> :x<CR>
nmap <C-w> :q!<CR>
nmap <leader>db :bd<CR>
nnoremap <C-p> :bprev<CR>
nnoremap <C-o> :bnext<CR>
vnoremap <Tab> >gV
vnoremap <S-Tab> <gV
nnoremap <silent> <leader>n :nohlsearch<CR>
"------------------ resize --------------------
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <silent> <right> :vertical resize +5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <up> :vertical resize +5<CR>
nnoremap <silent> <down> :vertical resize -5<CR>
"Maps of go to goto-preview
nnoremap <leader>pgo <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap <leader>pgi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
nnoremap <leader>pgc <cmd>lua require('goto-preview').close_all_win()<CR>
"maps git
nnoremap <Leader>gms :<C-u>call gitblame#echo()<CR>
nmap <leader>gs :G<CR>
nmap <leader>gi :diffget //2<CR>
nmap <leader>gd :diffget //3<CR>
