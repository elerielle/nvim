local original_deprecate = vim.deprecate
vim.deprecate = function(name, alternative, version, plugin, backtrace)
    if plugin == 'nvim-lspconfig' and name:find('require.*lspconfig') then
        return
    end
    original_deprecate(name, alternative, version, plugin, backtrace)
end

require("tim")
vim.cmd("set termguicolors")
-- vim.cmd("colorscheme cyberpunk")
-- vim.cmd("let g:airline_theme='cyberpunk'")

vim.cmd("set cursorline")
-- vim.cmd("let g:cyberpunk_cursorline='black'")
