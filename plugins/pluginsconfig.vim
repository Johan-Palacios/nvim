"
"   +----------------------------+
"   |                            |
"   |Jᴏʜᴀɴ Pᴀʟᴀᴄɪᴏs /NVIM-Cᴏɴғɪɢ |
"   |         I love NVIM        |
"   |   This is for NVIM 0.5_V   |
"   |                            |
"   +----------------------------+
"    _  ____ 
"   / |/  __\     GitHub: https://github.com/Johan-Palacios
"   | ||  \/|     Youtube: www.youtube.com/channel/UC8h9RRhxtAbpE3-J3RQljKQ
"/\_| ||  __/     IG: www.instagram.com/_el_johan/
"\____/\_/        FB: www.facebook.com/johan.palacios.fx/
"                 I use :                  ﬏
"
"AutoComplete Config 

let g:coc_global_extensions = [
  \ 'coc-omnisharp',
  \ 'coc-go',
  \ 'coc-tsserver',
  \ 'coc-html', 
  \ 'coc-css', 
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-clangd',
  \ 'coc-python',
  \ 'coc-pyright'
  \ ]


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"------------Config NERD TREE----------------
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
"------------Airline------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
"-------------------Tmux navigar-------------------
let g:tmux_navigator_save_on_switch = 2

"---------------------Neoformat-------------------
nnoremap <leader>nf :Neoformat<CR>
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
