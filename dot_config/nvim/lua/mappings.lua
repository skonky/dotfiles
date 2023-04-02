local map = vim.api.nvim_set_keymap -- keymap

function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

-- remove search highlight when pressing esc
map("n", "<ESC>", ":noh <CR>")

-- moving around windows with ctrl + hjkl
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- save buffer with ctrl + s
map("n", "<C-s>", ":w <CR>")
