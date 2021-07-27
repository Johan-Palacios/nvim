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


![image](https://user-images.githubusercontent.com/77251405/127188398-121053a3-52ac-4b73-8fe1-f5da6a70d64e.png)

------------
## English 🇺🇸

### Starting 🚀
This configuration have:
- Autocomplete with LSP
	- You can install more servers with [LSP](https://github.com/neovim/nvim-lspconfig "LSP") Install
- One dark theme for Neovim
- Plugins of sintaxis
- Tmux Navigator
- Telescope
- Fzf
- NerdCommenter
- Carbon screen
	- You can customize this in  `/plugins/pluginsconfig.vim` _the key by default is F17_
- Web Icons 😎
- Nvim Tree
- ToogleBar
- Galaxy line
- Barbar
- Neoformat
- Lua Config
- Dashbard
- StartupTime

### Requirements
- Nvim 0.5 or >
- Packer, You can install [here](https://github.com/wbthomason/packer.nvim "aquí")

## Instalation  🔧


First you need to the source of the nvim configurations

You can create that with this command in $HOME

`mkdir ~/.config/`

 Or clone the repo with this command

**HTTP**


`git clone https://github.com/Johan-Palacios/Nvim-config.git`

**SHH**

`git clone git@github.com:Johan-Palacios/Nvim-config.git`

**CLI GIT**

```gh repo clone Johan-Palacios/Nvim-config```

**Is veri important that you reneme the `Nvim-config` to `nvim`**

Later you need to go to `init.vim`, that have this configuration:

And run this command `so %` for indicate the main file

![image](https://user-images.githubusercontent.com/77251405/127188398-121053a3-52ac-4b73-8fe1-f5da6a70d64e.png)

In this part you can see all of the direction of the sources, first you need to go in plugins

- `cd plugins/plugins.vim`

And later you open the file. In this flile you need to chage the direction of the file acording of your configuration

	`~{your-name-in-directory}/.config/nvim/autoload/plugged`
In this file you install the plugins with this command

- `:PlugInstall`

![muuFv7Wj8m](https://user-images.githubusercontent.com/77251405/127194396-c5482c23-987e-4c6f-a89b-543de8f90562.gif)

And for the lua plugins use 


![image](https://user-images.githubusercontent.com/77251405/127194249-89b42e53-3006-43de-bc39-00b5524ce766.png)



Later of that you can fun with this config


## Autor ✒️

* **Johan Palacios** - *All Work* - [Johan-Palacios](https://github.com/Johan-Palacios)

## Español 🇪🇸
### Comenzando 🚀
Esta configuración tiene :
- Autocompletado con LSP Nativo
	- Esposible instalar más servers de autocompletado por [LSP](https://github.com/neovim/nvim-lspconfig "LSP")
- Tema One dark para Neovim
- Plugins de sintaxis
- Navegador rápido de Tmux
- Telescope
- Fzf
- NerdCommenter
- Carbon screen
	- Puedes configurar esto en los  `/plugins/pluginsconfig.vim` _Por defecto es F17_
- Iconos web cool 😎
- Nvim Tree
- ToogleBar
- Galaxy line
- Barbar
- Neoformat
- Configuración con Lua
- Dashbard
- StartupTime

### Requisitos 
- Nvim 0.5 o superior
- Packer, puedes instalarlo [aquí](https://github.com/wbthomason/packer.nvim "aquí")

## Instalación  🔧


Primero en tu directorio raiz debes crear la carpeta para las configuraciones de NVIM

Usa este comando para crear el directorio

```
mkdir ~/.config/

"Muevete al directorio con: "

cd /.config/
```

 Luego de esto Clona el repositiorio en dicha carpeta

**HTTP**


`git clone https://github.com/Johan-Palacios/Nvim-config.git`

**SHH**

`git clone git@github.com:Johan-Palacios/Nvim-config.git`

**CLI GIT**

```gh repo clone Johan-Palacios/Nvim-config```

**Esto creara una carpeta llamada  `Nvim-config` pero esta tendras que renombrarla como `nvim`** despues de esto muevete dentro de la carpeta nvim y muevete a  `init.vim` en donde tendras estas configuraciones:

Corre el comando de so para indicar que tu directorio raiz sea este `so %`

![image](https://user-images.githubusercontent.com/77251405/127188398-121053a3-52ac-4b73-8fe1-f5da6a70d64e.png)

Ahora vamos a iniciar con los plugins

Para eso muevete a la siguiente carpeta ` cd plugins/plugins.vim` abre el archivo y cambia el nombre que aparece como _johan_linux_ te adjunto el formato aquí:

`~{your-name-in-directory}/.config/nvim/autoload/plugged`

Luego corre el siguiente comando, te dejo un video donde muestro como hacerlo

- `:PlugInstall`

![muuFv7Wj8m](https://user-images.githubusercontent.com/77251405/127194396-c5482c23-987e-4c6f-a89b-543de8f90562.gif)


Y para los plugins de lua usa :

![image](https://user-images.githubusercontent.com/77251405/127194249-89b42e53-3006-43de-bc39-00b5524ce766.png)


Luego de esto puedes disfrutar de tu Neovim 😀
## Autor ✒️

* **Johan Palacios** - *Todo* - [Johan-Palacios](https://github.com/Johan-Palacios)
