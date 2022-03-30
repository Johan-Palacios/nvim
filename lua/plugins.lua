local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

local use = packer.use
vim.cmd([[packadd packer.nvim]])

packer.startup({
	{ ... },
	config = {
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
	},
})

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function()
	-- NOTE: PRINCIPAL PLUGINS
	use("wbthomason/packer.nvim")
	use("lewis6991/impatient.nvim")
	use("tweekmonster/startuptime.vim")
	use("nathom/filetype.nvim")
	use("antoinemadec/FixCursorHold.nvim")
	use("vim-scripts/restore_view.vim")
	use("moll/vim-bbye")
	-- NOTE: STYLE PLUGIND
	use("goolord/alpha-nvim")
	use("NTBBloodbath/galaxyline.nvim")
	use("joshdick/onedark.vim")
	use("akinsho/bufferline.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("lewis6991/gitsigns.nvim")
	use("nvim-lua/popup.nvim")
	use("editorconfig/editorconfig-vim")
	use("lukas-reineke/indent-blankline.nvim")
	use("rcarriga/nvim-notify")
	use("nvim-treesitter/nvim-treesitter")
	use("nvim-treesitter/playground")
	-- NOTE: PROYECT MANAGEMENT
	use({
		"VonHeikemen/fine-cmdline.nvim",
		requires = {
			{ "MunifTanjim/nui.nvim" },
		},
	})
	use("ahmedkhalf/project.nvim")
	-- NOTE: Insert mode plugins
	use("andymass/vim-matchup")
	use("tpope/vim-unimpaired")
	use("nvim-lua/plenary.nvim")
	use("windwp/nvim-autopairs")
	use("tpope/vim-surround")
	use({
		"anuvyklack/pretty-fold.nvim",
		config = function()
			require("pretty-fold").setup({})
			require("pretty-fold.preview").setup()
		end,
	})
	-- NOTE: TERMUX
	use("benmills/vimux")
	use("christoomey/vim-tmux-navigator")
	-- NOTE: TOOLS
	use("preservim/nerdcommenter")
	use("nvim-telescope/telescope.nvim")
	use("AndrewRadev/tagalong.vim")
	use("alvan/vim-closetag")
	use("norcalli/nvim-colorizer.lua")
	use("tpope/vim-fugitive")
	use("zivyangll/git-blame.vim")
	use("sindrets/diffview.nvim")
	use("nacro90/numb.nvim")
	use("Pocco81/AutoSave.nvim")
	use("akinsho/nvim-toggleterm.lua")
	use("rhysd/git-messenger.vim")
	use("karb94/neoscroll.nvim")
  use("simrat39/symbols-outline.nvim")
	use({
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({})
		end,
	})
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})
	use({
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({})
		end,
	})
	use("ggandor/lightspeed.nvim")
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-tree").setup({})
		end,
	})
	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({})
		end,
	})
	-- NOTE: Autocomplete
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lua")
	use("f3fora/cmp-spell")
	use("neovim/nvim-lspconfig")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("williamboman/nvim-lsp-installer")
	use("tamago324/nlsp-settings.nvim")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup()
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
