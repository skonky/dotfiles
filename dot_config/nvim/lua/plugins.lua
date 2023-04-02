-- https://github.com/folke/lazy.nvim#examples
local plugins = {
	"github/copilot.vim",
	"tpope/vim-sensible",
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"tpope/vim-commentary",
	"tpope/vim-fugitive",
	"tpope/vim-sleuth",
	"nvim-lua/plenary.nvim",
	"nvim-treesitter/nvim-treesitter",
	"jose-elias-alvarez/nvim-lsp-ts-utils",
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/cmp-vsnip",
	"RishabhRD/popfix",
	"RishabhRD/nvim-lsputils",
	"hrsh7th/vim-vsnip",
	"hrsh7th/vim-vsnip-integ",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-buffer",
	"ap/vim-css-color",
	"lewis6991/gitsigns.nvim",
	{ "folke/trouble.nvim",           keys = require("plugins.trouble.keys") },
	{ "kyazdani42/nvim-web-devicons", lazy = true },
	{
		"akinsho/toggleterm.nvim",
		config = function()
			local opts = require("plugins.toggleterm.config")
			require("toggleterm").setup(opts)
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		config = function()
			local opts = require("plugins.nvim_cmp.config")
			require("cmp").setup(opts)
		end,
	},
	{
		"xiyaowong/transparent.nvim",
		config = function()
			local opts = require("plugins.transparent.config")
			require("transparent").setup(opts)
		end,
	},
	{
		lazy = false,
		"romgrk/barbar.nvim",
		keys = require("plugins.barbar.keys"),
	},
	{
		"windwp/windline.nvim",
		config = function()
			local opts = require("plugins.windline.bubble_2")
			require("windline").setup(opts)
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		lazy = false,
		config = function()
			local opts = require("plugins.null_ls.config")
			require("null-ls").setup(opts)
		end,
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			require("plugins.lsp.config")
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		lazy = false,
		cmd = "NvimTree",
		keys = require("plugins.nvim_tree.keys"),
		config = function()
			local opts = require("plugins.nvim_tree.config")
			require("nvim-tree").setup(opts)
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		keys = require("plugins.telescope.keys"),
	},
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			local opts = require("plugins.tokyonight.config")
			require("tokyonight").setup(opts)
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}

return plugins
