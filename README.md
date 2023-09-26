<p align="center">
    <img alt="Johan Logo"
    src="https://user-images.githubusercontent.com/77251405/120911904-37bcd800-c648-11eb-9358-e62e4e16ac1c.png"
    height="160px"/>
  <h1 align="center">Neovim Config</h1>
</p>

<p align="center">
  <!-- <a href="https://github.com/Johan-Palacios/nvim/releases/latest"> -->
  <!--   <img alt="Latest release" src="https://img.shields.io/github/v/release/Johan-Palacios/nvim?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41" /> -->
  <!-- </a> -->
  <a href="https://github.com/Johan-Palacios/nvim/pulse">
    <img
      alt="Last commit"
      src="https://img.shields.io/github/last-commit/Johan-Palacios/nvim?style=for-the-badge&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41"
    />
  </a>
  <a href="https://github.com/Johan-Palacios/nvim/stargazers">
    <img
      alt="Stargazers"
      src="https://img.shields.io/github/stars/Johan-Palacios/nvim?style=for-the-badge&logo=starship&color=c678dd&logoColor=d9e0ee&labelColor=282a36"
    />
  </a>
  <a href="https://github.com/Johan-Palacios/nvim/issues">
    <img
      alt="Issues"
      src="https://img.shields.io/github/issues/Johan-Palacios/nvim?style=for-the-badge&logo=gitbook&color=f0c062&logoColor=d9e0ee&labelColor=282a36"
    />
  </a>
  <a href="https://github.com/Johan-Palacios/nvim/contributors">
    <img
      alt="Contributors"
      src="https://img.shields.io/github/contributors/Johan-Palacios/nvim?style=for-the-badge&logo=opensourceinitiative&color=abcf84&logoColor=d9e0ee&labelColor=282a36"
    />
  </a>
  <a href="https://github.com/Johan-Palacios/nvim">
    <img
      alt="Repo Size"
      src="https://img.shields.io/github/repo-size/Johan-Palacios/nvim?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41"
    />
  </a>
  <a href="https://github.com/Johan-Palacios/nvim/blob/main/LICENSE">
    <img
      alt="License"
      src="https://img.shields.io/github/license/lunarvim/lunarvim?style=for-the-badge&logo=starship&color=ee999f&logoColor=D9E0EE&labelColor=302D41"
    />
  </a>

</p>

# Neovim Configuration for Windows Subsystem Linux (WSL)

## ShowCase

![image](https://github.com/Johan-Palacios/nvim/assets/77251405/7219b7cf-3f63-4951-b2ab-f38839fedf7f)
![image](https://github.com/Johan-Palacios/nvim/assets/77251405/33a286b5-8234-4dc0-9124-026dec83cdcc)
![image](https://github.com/Johan-Palacios/nvim/assets/77251405/d0af3518-4e85-44f2-b5ca-161017850724)
![image](https://github.com/Johan-Palacios/nvim/assets/77251405/8df49c0f-10cc-445e-82ab-6aea8e0680bc)

---

## English 🇺🇸

### Starting 🚀

- Autocomplete with [LSP](https://neovim.io/doc/user/lsp.html) 
- Preconfigured Neovim

## Plugins

- Personal [One Dark](https://github.com/Johan-Palacios/onedarker) Theme
- Smooth scroll
- File navigation with [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) 
- Managing tabs and buffers with [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) 
- Nerd Font icons provided by [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- Native LSP configuration
- Completion plugin provided by [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- highly extendable fuzzy finder over lists [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- Syntax highlighting with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) 
- Display key bindings [whichkey.nvim](https://github.com/folke/which-key.nvim)
- Winbar [nvim-navic](https://github.com/SmiteshP/nvim-navic) 
- Statusline [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

### Requirements

- Neovim >= 0.8

## Instalation 🔧

### Linux/Macos 🐧

```bash

git clone https://github.com/Johan-Palacios/nvim ~/.config/nvim --depth 1 && nvim

```

#### Docker 🐋

```bash
docker run -w /root -it --rm alpine:latest sh -uelic '
  apk add git nodejs neovim ripgrep build-base wget --update
  git clone https://github.com/Johan-Palacios/nvim ~/.config/nvim
  nvim
  '

```

## Autor ✒️

- **Johan Palacios** - _Autor_ - [Johan-Palacios](https://github.com/Johan-Palacios)
