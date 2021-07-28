call plug#begin('~johan_linux/.config/nvim/autoload/plugged')
    "Use of VIM
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-unimpaired'
    Plug 'liuchengxu/vim-which-key'
    Plug 'benmills/vimux'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'janko-m/vim-test'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'preservim/nerdcommenter'
    Plug 'tpope/vim-repeat'
    Plug 'andymass/vim-matchup'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'glepnir/dashboard-nvim'
    Plug 'preservim/tagbar'
    Plug 'OmniSharp/omnisharp-vim'
    "Git
    Plug 'tpope/vim-fugitive'
    Plug 'zivyangll/git-blame.vim'
    "Files
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'kristijanhusak/vim-carbon-now-sh'
    "Sintax and pairs
    Plug 'jiangmiao/auto-pairs'
    Plug 'sheerun/vim-polyglot'
    Plug 'sbdchd/neoformat'
    "Themes
    Plug 'joshdick/onedark.vim'
    Plug 'romgrk/barbar.nvim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'ap/vim-css-color'
    "Pendiente
    " Plug 'alvan/vim-closetag'
    " Plug 'tpope/vim-surround'
    " Plug 'tyewang/vimux-jest-test'
    " Plug 'liuchengxu/vim-clap'
    call plug#end()
