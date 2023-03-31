local map = vim.api.nvim_set_keymap -- keymap

function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
    map("n", shortcut, command)
end

function imap(shortcut, command)
    map("i", shortcut, command)
end

-- remove search highlight when pressing esc
nmap("<ESC>", ":noh <CR>")

-- file navigation
nmap("<C-n>", ":NvimTreeToggle<CR>")
nmap("<leader>ff", "<cmd>Telescope find_files<cr>")
nmap("<leader>fw", "<cmd>Telescope live_grep<cr>")
nmap("<leader>fb", "<cmd>Telescope buffers<cr>")
nmap("<leader>fh", "<cmd>Telescope help_tags<cr>")
nmap("<leader>gt", "<cmd>Telescope git_status<cr>")

-- moving around windows with ctrl + hjkl
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- save buffer with ctrl + s
nmap("<C-s>", ":w <CR>")

-- toggle diagnostics panel
nmap("gE", ":TroubleToggle<cr>")
