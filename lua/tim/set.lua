vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.g.mapleader = " "

vim.opt.ignorecase = true

-- Provider host executables (avoid flaky auto-detection in mixed toolchains).
local node_host = vim.fn.exepath("neovim-node-host")
if node_host ~= "" then
    vim.g.node_host_prog = node_host
end

local python_host = vim.fn.exepath("pynvim-python")
if python_host ~= "" then
    vim.g.python3_host_prog = python_host
end

local ruby_host = vim.fn.glob(vim.fn.expand("~/.local/share/gem/ruby/*/bin/neovim-ruby-host"))
if ruby_host ~= "" then
    vim.g.ruby_host_prog = ruby_host
end

-- Treat MDX as markdown so marksman can attach without unknown filetype warnings.
vim.filetype.add({
    extension = {
        mdx = "markdown",
    },
})
