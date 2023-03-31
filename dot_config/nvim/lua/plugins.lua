local map = vim.api.nvim_set_keymap -- keymap
local buf_map = function(bufnr, mode, lhs, rhs, opts)
	vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
		silent = true,
	})
end

local on_attach = function(client, bufnr)
	vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
	vim.cmd("command! LspFormatting lua vim.lsp.buf.format({async = true})")
	vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
	vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
	vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
	vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
	vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
	vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
	vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
	vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
	vim.cmd("command! LspDiagLine lua vim.diagnostic.show_line_diagnostics()")
	vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
	buf_map(bufnr, "n", "gd", ":LspDef<CR>")
	buf_map(bufnr, "n", "gr", ":LspRename<CR>")
	buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
	buf_map(bufnr, "n", "K", ":LspHover<CR>")
	buf_map(bufnr, "n", "[d", ":LspDiagPrev<CR>")
	buf_map(bufnr, "n", "]d", ":LspDiagNext<CR>")
	buf_map(bufnr, "n", "ca", ":LspCodeAction<CR>")
	buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")
end

function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
	map("n", shortcut, command)
end

function imap(shortcut, command)
	map("i", shortcut, command)
end

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
	"folke/trouble.nvim",
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
	"lewis6991/gitsigns.nvim",
	"ap/vim-css-color",
	"hrsh7th/cmp-buffer",
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				-- Enable LSP snippets
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = {
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					-- Add tab support
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<M-Tab>"] = cmp.mapping.select_next_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),
				},
				-- Installed sources
				sources = {
					{ name = "nvim_lsp" },
					{ name = "vsnip" },
					{ name = "path" },
					{ name = "buffer" },
				},
			})
		end,
	},
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
				extra_groups = {
					"NvimTreeNormal",
					"NvimTreeStatusLine",
					"NvimTree",
					"LuaLine",
					"TabLineFill",
					"StatusLine",
				},       -- table: additional groups that should be cleared
				exclude_groups = {}, -- table: groups you don't want to clear
			})
		end,
	},
	{
		lazy = false,
		"romgrk/barbar.nvim",
		keys = {
			{ "<A-<>", ":BufferMovePrevious<CR>" },
			{ "<A->>", ":BufferMoveNext<CR>" },
			{ "<A-,>", ":BufferPrevious<CR>" },
			{ "<A-.>", ":BufferNext<CR>" },
			{ "<A-x>", ":BufferClose<CR>" },
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "tokyonight",
				},
			})
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		lazy = false,
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettier_d_slim,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.eslint_d,
					null_ls.builtins.code_actions.gitsigns,
					null_ls.builtins.diagnostics.write_good,
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format()
							end,
						})
					end
				end,
			})
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
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.cssls.setup({})
			lspconfig.cssmodules_ls.setup({})
			lspconfig.jsonls.setup({})
			lspconfig.tailwindcss.setup({})
			lspconfig.yamlls.setup({})

			lspconfig.tsserver.setup({
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
					local ts_utils = require("nvim-lsp-ts-utils")
					ts_utils.setup({
						eslint_bin = "eslint_d",
						eslint_enable_diagnostics = true,
						eslint_enable_code_actions = true,
						eslint_opts = {
							cwd = function(params)
								return require("lspconfig.util").root_pattern("tsconfig.json")(params.bufname)
							end,
						},
					})
					ts_utils.setup_client(client)
					buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
					buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
					buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
					on_attach(client, bufnr)
				end,
			})
		end,
	},
	{ "kyazdani42/nvim-web-devicons", lazy = true },
	{
		"kyazdani42/nvim-tree.lua",
		lazy = false,
		cmd = "NvimTree",
		keys = {
			{ "<C-n>", ":NvimTreeToggle<CR>" },
		},
		config = function()
			require("nvim-tree").setup({
				view = {
					adaptive_size = true,
				},
				git = {
					enable = true,
					ignore = false,
					timeout = 500,
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			nmap("<leader>ff", "<cmd>Telescope find_files<cr>")
			nmap("<leader>fw", "<cmd>Telescope live_grep<cr>")
			nmap("<leader>fb", "<cmd>Telescope buffers<cr>")
			nmap("<leader>fh", "<cmd>Telescope help_tags<cr>")
			nmap("<leader>gt", "<cmd>Telescope git_status<cr>")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("tokyonight").setup({
				transparent = true,
				styles = {
					sidebars = "transparent", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
			})
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}

return plugins
