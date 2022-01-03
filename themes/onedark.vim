if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256
syntax on
set t_Co=256
colorscheme onedark
highlight pmenu ctermbg=DarkGray guibg=onedark
highlight Search guibg='DarkGray' guifg='Black'
" highlight NvimTreeNormal guifg=#D8DEE9  guibg=#2a2e39
highlight NvimTreeRootFolder guifg=#D8DEE9
