-- Read this for help
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

require('plugins')

require('settings')

require('mappings')

require('lualine').setup()

require("nvim-tree").setup()

require('mason').setup()

-- function Sad(line_nr, from, to, fname)
--   vim.cmd(string.format("silent !sed -i '%ss/%s/%s/' %s", line_nr, from, to, fname)) 
-- end

-- function IncreasePadding() 
--   Sad('101', 0, 7, '~/.config/alacritty/alacritty.yml')
--   Sad('102', 0, 7, '~/.config/alacritty/alacritty.yml')
-- end

-- function DecreasePadding()
--   Sad('101', 7, 0, '~/.config/alacritty/alacritty.yml')
--   Sad('102', 7, 0, '~/.config/alacritty/alacritty.yml')
-- end

-- vim.cmd[[
--   augroup ChangeAlacrittyPadding
--    au! 
--    au VimEnter * lua DecreasePadding()
--    au VimLeavePre * lua IncreasePadding()
--   augroup END 
-- ]]

