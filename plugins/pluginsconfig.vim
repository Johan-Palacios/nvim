"
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

"-------------------Tmux navigar-------------------
let g:tmux_navigator_save_on_switch = 2
"---------------------Neoformat-------------------
autocmd BufWritePre *.js :Neoformat
autocmd BufWritePre *.json :Neoformat
autocmd BufWritePre *.html :Neoformat
autocmd BufWritePre *.css :Neoformat
autocmd BufWritePre *.ts :Neoformat
autocmd BufWritePre *.scss :Neoformat
autocmd BufWritePre *.c :Neoformat
autocmd BufWritePre *.cpp :Neoformat
autocmd BufWritePre *.cs :Neoformat
autocmd BufWritePre *.lua :Neoformat
"---------------------ALE------------------------
let g:ale_linters = {
\   'python': ['flake8', 'pydocstyle', 'bandit', 'mypy'],
\   'cs': ['Omnisharp']
\}

"\   '*': ['remove_trailing_lines', 'trim_whitespace'],

let g:ale_fixers = {
\   'python': ['black', 'isort'],
\}

let g:ale_fix_on_save = 1
"---------------Telescope---------------------------
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
luafile $HOME/.config/nvim/lua/pg-telescope/init.lua
"---------------BarBar comands--------------------
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>

let bufferline = get(g:, 'bufferline', {})
let bufferline.animation = v:true
let bufferline.auto_hide = v:false
let bufferline.tabpages = v:true
let bufferline.closable = v:true
let bufferline.clickable = v:true
let bufferline.icons = v:true
let bufferline.icon_custom_colors = v:false
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'
let bufferline.maximum_padding = 4
let bufferline.maximum_length = 30
let bufferline.semantic_letters = v:true
let bufferline.letters =
  \ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'
let bufferline.no_name_title = v:null

"---------------------DashBoard-----------------
luafile $HOME/.config/nvim/lua/pg-dash/init.lua
"--------------------Tagbar Comd---------------
nnoremap <F13> :TagbarToggle<CR>
"-------------- Nvimtree ----------------------
let g:nvim_tree_auto_open = 1
let g:nvim_tree_auto_close = 1
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_auto_ignore_ft = ["dashboard"]
    let g:indent_blankline_filetype_exclude = ["help", "terminal", "dashboard"]
"---------------------NERDCOMMNETER----------
let g:NERDCreateDefaultMappings = 1
"--------------------LSP------------------
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

"Omnisharp
let g:OmniSharp_server_stdio = 0
" inoremap <expr> <Tab> pumvisible() ? '<C-n>' :
" \ getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_autoselect_existing_sln = 1
" let g:Omnisharp_popup_position = 'peek'
" let g:Omnisharp_highlighting = 3
" let g:OmniSharp_start_server = 1
" let g:OmniSharp_translate_cygwin_wsl = 0
"-------------------Nvim.TREE-------------------------
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:nvim_tree_update_cwd = 1
"Carbon
vnoremap <F17> :CarbonNowSh
let g:carbon_now_sh_browser = ''
let g:carbon_now_sh_options =
\ { 'ln': 'true',
  \ 'fm': 'Source Code Pro' }
"Lazzygit
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed
