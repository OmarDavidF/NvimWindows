local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	---------------------
	-- Package Manager --
	---------------------
	use("wbthomason/packer.nvim") --> Packer manage itself

	------------------
	-- Dependencies --
	------------------
	use("lewis6991/impatient.nvim")
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("nvim-lua/popup.nvim")

	-----------------------------------------------
	-- Themes, Icons, Tree, Statusbar, Bufferbar --
	-----------------------------------------------
	-- Themes --
	use("lunarvim/darkplus.nvim")
	use("ellisonleao/gruvbox.nvim")
	use("folke/tokyonight.nvim")
	use("navarasu/onedark.nvim")
	use("rebelot/kanagawa.nvim")
	use("EdenEast/nightfox.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("Mofiqul/dracula.nvim")
	-- Status Line --
	use("nvim-lualine/lualine.nvim")
	-- Buffer Tab line --
	use({ "akinsho/bufferline.nvim", tag = "v2.*" })
	use("numtostr/BufOnly.nvim") --> Close all buffers except current
	--Dashboard --
	use("goolord/alpha-nvim")

	------------------
	-- LSP Lenguaje --
	------------------
	use("neovim/nvim-lspconfig") --> Enable native LSP
	use("williamboman/mason.nvim") --> New LSP Installer
	use("williamboman/mason-lspconfig.nvim") --> New LSP server Installer
	use("RRethy/vim-illuminate")
	-- -- Code Runner
	use("is0n/jaq-nvim")
	--  Formatters --
	use("jose-elias-alvarez/null-ls.nvim") --> Inject LSP diagnostics, code actions, formatters ...
	--LSP diagnostics
	use({ "folke/trouble.nvim", cmd = "TroubleToggle" })

	--------------------
	-- Autocompletion --
	--------------------
	use("hrsh7th/nvim-cmp") --> Completion (cmp) plugin
	use("hrsh7th/cmp-buffer") --> Cmp source for buffer words
	use("hrsh7th/cmp-path") --> Cmp source for path
	use("hrsh7th/cmp-nvim-lsp") --> Cmp source for LSP client
	use("hrsh7th/cmp-nvim-lua") --> Cmp source for nvim lua
	use("hrsh7th/cmp-cmdline") --> Cmp source for Vim commands
	use("saadparwaiz1/cmp_luasnip") --> Luasnip completion source
	-- Snippets --
	use("L3MON4D3/LuaSnip") --> Snippet engine
	use("rafamadriz/friendly-snippets") --> a bunch of snippets to use

	--------------------------------------
	-- DAP (Required to run unit tests) --
	--------------------------------------
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	---------
	-- Git --
	---------
	use({ "lewis6991/gitsigns.nvim" })
	use({ "f-person/git-blame.nvim", cmd = "GitBlameToggle" })
	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = function()
			require("git-conflict").setup()
		end,
	})

	--------------------------------------
	-- File Navigation and Fuzzy Search --
	--------------------------------------
	-- Nvim Tree --
	use("kyazdani42/nvim-tree.lua")
	-- Telescope --
	use("nvim-telescope/telescope.nvim")
	-- Find projects --
	use("ahmedkhalf/project.nvim")
	-- Key Navigator --
	use("folke/which-key.nvim")

	----------------
	-- Treesitter --
	----------------
	use({ "nvim-treesitter/nvim-treesitter" }) --> Syntax highlighting, al salir error salir y entrar
	use("windwp/nvim-autopairs") --> Autoclose quotes, parentheses etc

	-------------
	-- General --
	-------------
	-- adds indentation guides to all lines (including empty lines)
	use("lukas-reineke/indent-blankline.nvim")
	-- shadow --
	use("sunjon/shade.nvim")
	--Show colors
	use("norcalli/nvim-colorizer.lua")
	--#region
	use("ziontee113/color-picker.nvim")
	-- comment highlighting --
	use("folke/todo-comments.nvim")
	-- comment highlighting --
	use("numToStr/Comment.nvim")
	-- Terminal --
	use({ "akinsho/toggleterm.nvim", tag = "*" }) --> persist and toggle multiple
	-- Hop --
	use({ "phaazon/hop.nvim", branch = "v2" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
