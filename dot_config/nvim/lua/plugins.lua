local Plug = vim.fn['plug#'] 

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lukas-reineke/lsp-format.nvim'


Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'ThePrimeagen/harpoon'
Plug 'simrat39/rust-tools.nvim'
Plug 'rust-lang/rust.vim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'kevinoid/vim-jsonc'
Plug 'williamboman/mason.nvim'

Plug 'kyazdani42/nvim-tree.lua'
Plug 'rktjmp/lush.nvim'
Plug 'akai54/2077.nvim'
Plug 'akinsho/flutter-tools.nvim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'ap/vim-css-color'
Plug 'jparise/vim-graphql'
Plug 'sotte/presenting.vim'
Plug 'romgrk/barbar.nvim'
Plug 'elmcast/elm-vim'
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'lewis6991/gitsigns.nvim'

-- colorschemes
Plug 'liuchengxu/space-vim-dark'
Plug 'dylanaraps/wal.vim' 
Plug 'joshdick/onedark.vim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'patstockwell/vim-monokai-tasty'
Plug('catppuccin/nvim', {['as'] = 'catpuccin'})
Plug('sonph/onehalf', {['rtp'] = 'vim/'})
Plug('folke/tokyonight.nvim', { ['branch'] = 'main' })
Plug('AlphaTechnolog/pywal.nvim', { ['as']= 'pywal' })


-- Plug('prettier/vim-prettier', { ['do'] = 'yarn install --frozen-lockfile --production' })



vim.call('plug#end')

-- Unfortunately vim-plug has a couple of options that will cause
-- an error if we use this syntax, those are for and do.
-- In this case we need to wrap the key in quotes and square brackets.
-- Plug('junegunn/goyo.vim', {['for'] = 'markdown'})
-- Plug('scrooloose/nerdtree', {on = 'NERDTreeToggle'})
