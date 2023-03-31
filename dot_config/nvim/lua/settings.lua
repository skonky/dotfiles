local s = vim.opt -- options
local g = vim.g -- global
local c = vim.cmd -- commands

c("colorscheme torte")

s.tabstop=4
s.guicursor="n-v-c:block"
s.softtabstop=4
s.timeout=false
s.encoding="utf-8"
s.shiftwidth=4
s.expandtab=true
s.smartindent=true
s.exrc=true
s.relativenumber=true
s.hlsearch=true
s.hidden=true
s.errorbells=false
s.nu=true
s.wrap=true
s.swapfile=false
s.backup=false
s.incsearch=true
s.termguicolors=true
s.scrolloff=10
s.showmode=false
s.completeopt="menuone,noinsert,noselect"
s.mouse="a"
s.cmdheight=1
s.updatetime=50
s.signcolumn="yes"
s.shortmess="a"
s.clipboard="unnamedplus"
s.background="dark"

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.mapleader = " "
g.netrw_banner = 0
