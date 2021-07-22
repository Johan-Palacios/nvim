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

"-------------Init set and let for NVIM-------------------------
set encoding=utf-8
set showtabline=2
set nocompatible
set autoindent
set fdm=indent
set foldlevelstart=99
set cmdheight=2
set number
set title
set splitright
set splitbelow
set number
set mouse=a
set nowrap
set cursorline
set pastetoggle=<F14>
set showmode
set colorcolumn=120
set tabstop=2
set shiftwidth=4
set softtabstop=2
set shiftround
set expandtab
set hidden
set ignorecase
set smartcase
set spelllang=en,es
set termguicolors
set background=dark
set noma
set write
set ma
set modifiable
set clipboard+=unnamedplus
set rnu
let mapleader="\<Space>"
let maplocalleader="//"
nnoremap <F14> :set invpaste paste?<CR>
filetype on
filetype plugin on
filetype plugin indent on
set timeoutlen=1000
set ttimeoutlen=0
"-----------------NVIM 0.5V--------------

if has("nvim-0.5.0") || has("patch-8.1.1564")

  set signcolumn=number
else
  set signcolumn=yes
endif

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

nmap <Leader>fr :ToggleTerm<CR>
nnoremap <silent> <leader>gg :LazyGit<CR>
"Tab trigger 
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"Personal Comands
map <C-t> :NvimTreeOpen<CR>
nmap <C-s> :w<CR>
nmap <C-m> :x<CR>
nmap <C-w> :q!<CR>
nmap <leader>db :bd<CR>
nnoremap <C-p> :bprev<CR>
nnoremap <C-o> :bnext<CR>
vnoremap <Tab> >gV
vnoremap <S-Tab> <gV
"------------------ resize --------------------
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <silent> <right> :vertical resize +5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <up> :vertical resize +5<CR>
nnoremap <silent> <down> :vertical resize -5<CR>
