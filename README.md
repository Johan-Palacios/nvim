<p align="center">
    <img alt="Johan Logo" src="https://user-images.githubusercontent.com/77251405/120911904-37bcd800-c648-11eb-9358-e62e4e16ac1c.png" height="160" />
  </a>
  <p align="center">Johan NVIM Configurations/Configuraciones de Johan para Neovim</p>
  <p align="center">
  <p>With this configurations you can customize your NEOVIM for programming use/ Con estas configuraciones podras customizar Neovim a tus gusto para programar
  </p>
  </p>
</p>

# Neovim Configuration  for Windows Subsystem Linux (WLS)


## Preview / Pre-visualización 🕹️


![img](https://i.imgur.com/i4pZ1ps.png)

------------
## English 🇺🇸

### Starting 🚀
This configuration have:
- Autocomplete of [Coc](https://github.com/neoclide/coc.nvim "CoC")
	-  Coc-Kite
	- Coc-go
	- Coc-html
	- Coc-json
	- Coc-omnisharp
	- Coc-prettier
	- Coc-pyright
	- Coc-python
	- Coc-tsserver
	- Coc-css
- One Dark theme for Neovim 
- Syntax plugins
- Airline plugin for One Dark
- Fast Navigator
- Telescope 
- Fzf
- NerdCommenter
- Carbon screen
	-You can configure this in `/plugins/pluginsconfig.vim` _default is F17_
- Cool Icons
- Nerd Tree

_This configurations only works in NVIM 0.5 > _
## Instalation  🔧


First you need to the source of the nvim configurations

You can create that with this command in $HOME

`mkdir ~/.config/nvim/`

 Or clone the repo with this command
 
**HTTP**


`git clone https://github.com/Johan-Palacios/Nvim-config.git`

**SHH**

`git clone git@github.com:Johan-Palacios/Nvim-config.git`

**CLI GIT**

```gh repo clone Johan-Palacios/Nvim-config```


Later you need to go to `init.vim`, that have this configuration:

And run this command `so %` for indicate the main file

![img](https://i.imgur.com/LBmN9BU.png)

In this part you can see all of the direction of the sources, first you need to go in plugins 

- `cd plugins/plugins.vim`

And later you open the file. In this flile you need to chage the direction of the file acording of your configuration

	`~{your-name-in-directory}/.config/nvim/autoload/plugged`
In this file you install the plugins with this command

- `:PlugInstall`

<a href="https://imgur.com/tfJNdUq"><img src="https://i.imgur.com/tfJNdUq.gif" title="source: imgur.com" /></a>


Later of that you need to install the autocomplete dependences of coc

```vb
:CocInstall coc-omnisharp coc-go coc-tsserver coc-html coc-css coc-json coc-prettier coc-python coc-pyright coc-kite
```

Later of that you can fun with that configuration 😀


## Autor ✒️

* **Johan Palacios** - *All Work* - [Johan-Palacios](https://github.com/Johan-Palacios)

## Español 🇪🇸
### Comenzando 🚀
Esta configuración tiene :
- Autocompletado con  [Coc](https://github.com/neoclide/coc.nvim "CoC")
	-  Coc-Kite
	- Coc-go
	- Coc-html
	- Coc-json
	- Coc-omnisharp
	- Coc-prettier
	- Coc-pyright
	- Coc-python
	- Coc-tsserver
	- Coc-css
- Tema One dark para Neovim 
- Plugins de sintaxis
- Airline plugin para One Dark
- Navegador rápido de Tmux
- Telescope 
- Fzf
- NerdCommenter
- Carbon screen
	- Puedes configurar esto en los  `/plugins/pluginsconfig.vim` _Por defecto es F17_
- Iconos web cool 😎
- Nerd Tree 

_Esta configuración solo funciona en  NVIM 0.5  o superior_
## Instalación  🔧


Primero en tu directorio raiz debes crear la carpeta para las configuraciones de NVIM

Usa este comando para crear el directorio

```
mkdir ~/.config/nvim/

"Muevete al directorio con: "

cd /.config/nvim/
```

 Luego de esto Clona el repositiorio en dicha carpeta
 
**HTTP**


`git clone https://github.com/Johan-Palacios/Nvim-config.git`

**SHH**

`git clone git@github.com:Johan-Palacios/Nvim-config.git`

**CLI GIT**

```gh repo clone Johan-Palacios/Nvim-config```



Luego muevete a  `init.vim` en donde tendras estas configuraciones:

Corre el comando de so para indicar que tu directorio raiz sea este `so %`

![img](https://i.imgur.com/LBmN9BU.png)

Ahora vamos a iniciar con los plugins 

Para eso muevete a la siguiente carpeta ` cd plugins/plugins.vim` abre el archivo y cambia el nombre que aparece como _johan_linux_ te adjunto el formato aquí:

`~{your-name-in-directory}/.config/nvim/autoload/plugged`

Luego corre el siguiente comando, te dejo un video donde muestro como hacerlo

- `:PlugInstall`

<a href="https://imgur.com/tfJNdUq"><img src="https://i.imgur.com/tfJNdUq.gif" title="source: imgur.com" /></a>


Ahora vamos a instalar los servidores para el autocompletado de Coc

```vb
:CocInstall coc-omnisharp coc-go coc-tsserver coc-html coc-css coc-json coc-prettier coc-python coc-pyright coc-kite
```

Luego de esto puedes disfrutar de tu Neovim 😀
## Autor ✒️

* **Johan Palacios** - *Todo* - [Johan-Palacios](https://github.com/Johan-Palacios)
