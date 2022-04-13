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
syntax off
set t_Co=256
colorscheme onedark
highlight pmenu ctermbg=DarkGray guibg=onedark
highlight Search guibg='DarkGray' guifg='Black'
hi foldcolumn guibg=#1e2127
hi VertSplit guibg=#1e2127 guifg=#1e2127
hi NvimTreeNormal guibg=#21242b
"Colors menu
" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#61AFEF
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#61AFEF
" light blue
" highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
" highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
" highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" " pink
" highlight! CmpItemKindFunction guibg=NONE guifg=#C678DD
" highlight! CmpItemKindMethod guibg=NONE guifg=#C678DD
" " front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4


" highlight CmpItemKindSnippet guibg=NONE guifg=#E5C07B
