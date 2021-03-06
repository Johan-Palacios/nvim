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
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
  augroup END
endif
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256
set t_Co=256
colorscheme onedark
" NvimTree colors
" hi foldcolumn guibg=#21242b
" hi VertSplit guibg=#21242b guifg=#21242b
" hi NvimTreeNormal guibg=#21242b
"Cmp color menu and winbar
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
highlight! CmpItemAbbrMatch guibg=NONE guifg=#61AFEF "Color in bar
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#55b6c2
highlight! CmpItemKindVariable guibg=NONE guifg=#BA99F6
highlight! CmpItemKindInterface guibg=NONE guifg=#e06c75
highlight! CmpItemKindText guibg=NONE guifg=#98c379
highlight! CmpItemKindFunction guibg=NONE guifg=#C678DD
highlight! CmpItemKindMethod guibg=NONE guifg=#e06c75
highlight! CmpItemKindKeyword guibg=NONE guifg=#e5c07b
highlight! CmpItemKindProperty guibg=NONE guifg=#61AFEF
highlight! CmpItemKindUnit guibg=NONE guifg=#abb2bf
highlight CmpItemKindSnippet guibg=NONE guifg=#e06c75
" Menu highlight
highlight pmenu ctermbg=DarkGray guibg=onedark
highlight Search guibg='DarkGray' guifg='Black'
hi StatusLine guibg=NONE
hi LspCodeLens guibg=NONE guifg=#4e545f
