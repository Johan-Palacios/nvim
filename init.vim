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
"


call plug#begin('~johan_linux/.config/nvim/autoload/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'sheerun/vim-polyglot'
    Plug 'morhetz/gruvbox'
    Plug 'mhinz/vim-startify'
    Plug 'preservim/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'jiangmiao/auto-pairs'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-unimpaired'
    Plug 'liuchengxu/vim-which-key'
    Plug 'ryanoasis/vim-devicons'
    Plug 'sheerun/vim-polyglot'
    "Plug 'maximbaz/lightline-ale'
    "Plug 'itchyny/lightline.vim'
    Plug 'shinchu/lightline-gruvbox.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'alvan/vim-closetag'
    Plug 'tpope/vim-surround'
    Plug 'benmills/vimux'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'tyewang/vimux-jest-test'
    Plug 'janko-m/vim-test'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'easymotion/vim-easymotion'
    Plug 'mhinz/vim-signify'
    Plug 'yggdroot/indentline'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    call plug#end()
"-------------Init set and let for NVIM-------------------------
set encoding=utf-8
set showtabline=2
set cmdheight=2
set number
set title 
set number
set mouse=a
set nowrap
set cursorline
set pastetoggle=<F14>
set showmode
set colorcolumn=120
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab
set hidden
set ignorecase
set smartcase
set spelllang=en,es
set termguicolors
set background=dark
set clipboard+=unnamedplus
set rnu 
let mapleader="\<Space>"
"-----------------NVIM 0.5V--------------

if has("nvim-0.5.0") || has("patch-8.1.1564")

  set signcolumn=number
else
  set signcolumn=yes
endif

"-------------Kite Config------------------------------

if &filetype == "javascript" || &filetype == "python"
    inoremap <c-space> <C-x><C-u>
else
    inoremap <silent><expr> <c-space> coc#refresh()
endif

"********>Support languages Kite<****************

let g:kite_suported_languages=['javascript', 'python']

"********>AutoComplete Kite<***********************

let g:kite_auto_complete=1
let g:kite_tab_complete=1
set completeopt+=menu
set completeopt+=menuone
set completeopt-=longest
set completeopt-=preview
set completeopt+=noinsert
set completeopt-=noselect
autocmd CompleteDone * if !pumvisible() | pclose | endif

"--------------------COC -------------------------------

autocmd FileType python let b:coc_suggest_disable = 1
autocmd FileType javascript let b:coc_suggest_disable = 1
autocmd FileType scss setl iskeyword+=@-@

" Use K to show documentation in preview window.

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
"--------------Themes---------------------------
set t_Co=256
let g:airline_theme='gruvbox'

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme gruvbox

"------------Airline------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''


"---------------Maps------------------

nmap <silent> gd <Plug> (coc-definition)
nmap <silent> gy <Plug> (coc-type-definition)
"-->Paste comands
nnoremap <F14> :set invpaste paste?<CR>
" ----------- vim-syntastic ---------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers = ['flake8', 'pylint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Telescope ATJ
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

