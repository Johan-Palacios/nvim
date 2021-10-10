"  +----------------------------+
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
"=============================================================
"Esencial Config
source $HOME/.config/nvim/maps/esencial.vim
"Lua plugins
lua require 'init'
lua require('impatient')
lua require'impatient'.enable_profile()
"Themes
source $HOME/.config/nvim/themes/onedark.vim
"Maps
source $HOME/.config/nvim/maps/maps.vim
"Plugins Config
source $HOME/.config/nvim/plugins/pluginsconfig.vim
"=============================================================
