source $HOME/.config/nvim/plugins/TMUX/tmux.vim
source $HOME/.config/nvim/plugins/NEOFORMAT/NEOFORMAT.vim
source $HOME/.config/nvim/plugins/OMNISHARP/OMNISHARP.vim
source $HOME/.config/nvim/plugins/TELESCOPE/TELESCOPE.vim
source $HOME/.config/nvim/plugins/BARBAR/BARBAR.vim
source $HOME/.config/nvim/plugins/EASYM/EASY.vim
source $HOME/.config/nvim/plugins/NVIMTREE/TREE.vim
source $HOME/.config/nvim/plugins/LSP/LSP.vim
source $HOME/.config/nvim/plugins/CARBON/CARBON.vim
source $HOME/.config/nvim/plugins/GIT/GIT.vim
luafile $HOME/.config/nvim/lua/pg-dash/init.lua
luafile $HOME/.config/nvim/plugins/NVIMTREE/lTree.lua
" luafile $HOME/.config/nvim/lua/pg-coments/init.lua
let g:kite_log=1





au User lsp_setup call lsp#register_server({
     \ 'name': 'kite',
     \ 'cmd': '~/.local/share/kite/current/kite-lsp --editor=nvim',
     \ 'whitelist': ["php", "javascript", "python", "bash"],
     \ })
