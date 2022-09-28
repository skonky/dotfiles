local set = vim.opt -- options
local g = vim.g -- global

set.tabstop=4
set.guicursor="n-v-c:block"
set.softtabstop=4
set.timeout=false
set.encoding="utf-8"
set.shiftwidth=4
set.expandtab=true
set.smartindent=true
set.exrc=true
set.relativenumber=true
set.hlsearch=false
set.hidden=true
set.errorbells=false
set.nu=true
set.wrap=false
set.swapfile=false
set.backup=false
set.incsearch=true
set.termguicolors=true
set.scrolloff=8
set.showmode=false
set.completeopt="menuone,noinsert,noselect"
set.mouse="a"
set.cmdheight=1
set.updatetime=50
set.signcolumn="yes"
set.shortmess="c"
set.clipboard="unnamedplus"
set.background="dark"

-- global settings
g.dart_format_on_save = 1
g.rustfmt_autosave = 1
g.lsc_auto_map = true
g.limelight_conceal_ctermfg = 240
g.mapleader = " "
g.netrw_banner = 0
g.everforest_background = 'soft'
g.everforest_better_performance = 1

-- remove default mapping for lf (lf opens in floatterm as alt. to NERDTree)
-- g.lf_map_keys = 0
-- g.lf_replace_netrw = 1
-- g.floaterm_height = 0.9
-- g.floaterm_width = 0.9
-- window settings
--
-- g.catppuccin_flavour = "macchiato"
-- require("catppuccin").setup()

vim.cmd("colorscheme tokyonight-night")
-- enable this for transparent BG:D only then limelight will not work :(
-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("let NERDTreeShowHidden=1")

