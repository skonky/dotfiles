local map = vim.api.nvim_set_keymap -- keymap

function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
    map('n', shortcut, command)
end

function imap(shortcut, command)
    map('i', shortcut, command)
end

-- file navigation
nmap("<leader>n", ":NvimTreeFindFile<CR>")
nmap("<leader>m", ":NvimTreeClose<CR>")
map("n", '<leader>fe', ":LfCurrentDirectory<CR>")
map("n", '<leader>fw', ":LfWorkingDirectory<CR>")
nmap("<leader>ff", "<cmd>Telescope find_files<cr>")
nmap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nmap("<leader>fb", "<cmd>Telescope buffers<cr>")
nmap("<leader>fh", "<cmd>Telescope help_tags<cr>")
nmap("<leader>gs", "<cmd>Telescope git_status<cr>")

map("n", '<leader>l', ":Limelight!!<CR>")

-- quickly jump between working files
nmap('<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<cr>')
nmap('<leader>a', ':lua require("harpoon.mark").add_file()<cr>')
nmap('<C-h>', ':lua require("harpoon.ui").nav_file(1)<cr>')
nmap('<C-j>', ':lua require("harpoon.ui").nav_file(2)<cr>')
nmap('<C-k>', ':lua require("harpoon.ui").nav_file(3)<cr>')
nmap('<C-l>', ':lua require("harpoon.ui").nav_file(4)<cr>')

-- lsp stuff
require('lsp')

nmap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
nmap('gD','<cmd>lua vim.lsp.buf.implementation()<CR>')
nmap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
nmap('g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
nmap('gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
nmap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
nmap('gE', ':LSClientAllDiagnostics<cr>')

-- misc
nmap('<c-g>',':Goyo<cr>')


-- buffer tab bar
nmap('<A-c>', ':BufferClose<CR>')

nmap('<A-<>', ':BufferMovePrevious<CR>')
nmap('<A->>', ':BufferMoveNext<CR>')
nmap('<A-,>', ':BufferPrevious<CR>')
nmap('<A-.>', ':BufferNext<CR>')
nmap('<C-s>', ':BufferPick<CR>')

