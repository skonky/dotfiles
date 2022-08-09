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
-- Plug 'preservim/nerdtree'
Plug 'rktjmp/lush.nvim'
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

-- colorschemes
Plug('catppuccin/nvim', {['as'] = 'catpuccin'})
Plug('sonph/onehalf', {['rtp'] = 'vim/'})
Plug('lourenci/github-colors', { ['branch'] = 'main' })
Plug('folke/tokyonight.nvim', { ['branch'] = 'main' })
Plug('embark-theme/vim', { ['as'] = 'embark', ['branch'] = 'main' })
Plug('prettier/vim-prettier', { ['do'] = 'yarn install --frozen-lockfile --production' })

Plug 'joshdick/onedark.vim'
Plug 'sainnhe/everforest'
Plug 'dracula/vim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vimpostor/vim-prism'
Plug 'mvpopuk/inspired-github.vim'
Plug 'scolsen/hara'
Plug 'cideM/yui'
Plug 'pgdouyon/vim-yin-yang'
Plug 'shaeinst/roshnivim-cs' -- rvcs
Plug 'rafamadriz/neon'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'bluz71/vim-moonfly-colors'
Plug 'rockerBOO/boo-colorscheme-nvim'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'phanviet/vim-monokai-pro'
Plug 'n1ghtmare/noirblaze-vim'
Plug 'andreasvc/vim-256noir'
Plug 'nikolvs/vim-sunbather'
Plug 'ericbn/vim-solarized'


vim.call('plug#end')

-- Unfortunately vim-plug has a couple of options that will cause
-- an error if we use this syntax, those are for and do.
-- In this case we need to wrap the key in quotes and square brackets.
-- Plug('junegunn/goyo.vim', {['for'] = 'markdown'})
-- Plug('scrooloose/nerdtree', {on = 'NERDTreeToggle'})
