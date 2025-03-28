vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>o", ":ClangdSwitchSourceHeader<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")

vim.keymap.set("n", "<leader>er", ":lua vim.diagnostic.open_float()<CR>")





vim.keymap.set("n", "<leader>tr", ":lua require('neotest').run.run()<CR>")
vim.keymap.set("n", "<leader>td", ":lua require('neotest').run.run(){strategy = 'dap'}<CR>")







vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
--
vim.keymap.set('n', '<leader>fi', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', '<leader>re', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<leader>fo', '<cmd> lua vim.lsp.buf.format()<CR>')
