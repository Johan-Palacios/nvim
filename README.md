# Neovim Configuration  for Windows Subsystem Linux (WLS)                                [![Neovim](https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-300x87.png)](https://neovim.io)
------------

## Preview


![img](https://i.imgur.com/i4pZ1ps.png)

------------


First you need to clone the repo with this command
## Instalation

First you need to the source of the nvim configurations

You can create that with this command in $HOME

`mkdir ~/.config/nvim/`

HTTP

`git clone https://github.com/Johan-Palacios/Nvim-config.git`

Shh

`git clone git@github.com:Johan-Palacios/Nvim-config.git`

Cli git

`gh repo clone Johan-Palacios/Nvim-config`

Later you need to go to `init.vim`, that have this configuration:

and run this command `so %`
![img](https://i.imgur.com/LBmN9BU.png)

In this part you can see all of the direction of the sources, first you need to go in plugins 

`/plugins/` and later you open the file. In this flile you need to chage the direction of the file acording of your configuration
`~{your nameindirectory}/.config/nvim/autoload/plugged`
In this file you install the plugins with this command

`:PlugInstall`

Later of that you need to install the autocomplete dependences of coc

	`:CocInstall coc-omnisharp coc-go coc-tsserver coc-html coc-css coc-json coc-prettier coc-python -coc-pyright coc-kite`

	Later of that you can fun whit that configuration 😀

------------


First you need to clone the repo with this command
## Instalation

First you need to the source of the nvim configurations

You can create that with this command in $HOME

`mkdir ~/.config/nvim/`

HTTP
`git clone https://github.com/Johan-Palacios/Nvim-config.git`
SHH
`git clone git@github.com:Johan-Palacios/Nvim-config.git`
CLI git
`gh repo clone Johan-Palacios/Nvim-config`

Later you need to go to `init.vim`, that have this configuration:

and run this command `so %`

In this part you can see all of the direction of the sources, first you need to go in plugins 

`/plugins/` and later you open the file. In this flile you need to chage the direction of the file acording of your configuration

`~{your nameindirectory}/.config/nvim/autoload/plugged`


In this file you install the plugins with this command

`:PlugInstall`

<a href="https://imgur.com/tfJNdUq"><img src="https://i.imgur.com/tfJNdUq.gif" title="source: imgur.com" /></a>

Later of that you need to install the autocomplete dependences of coc

`:CocInstall coc-omnisharp coc-go coc-tsserver coc-html coc-css coc-json coc-prettier coc-python -coc-pyright coc-kite `

Later of that you can fun whit that configuration 😀
