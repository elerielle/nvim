-- local lsp_zero = require('lsp-zero')

-- local lsp_attach = function(client, bufnr)
--     -- see :help lsp-zero-keybindings
--     -- to learn the available actions
--     --lsp_zero.default_keymaps({ buffer = bufnr })
--     local opts = { buffer = bufnr }
--
-- end
--
-- lsp_zero.extend_lspconfig({
--     sign_text = true,
--     lsp_attach = lsp_attach,
--     capabilities = require('blink.cmp').default_capabilities(),
--     float_border = 'rounded',
-- })
--
-- local cmp = require('cmp')
-- local cmp_action = require('lsp-zero').cmp_action()
-- cmp.setup({
--     window = {
--         completion = cmp.config.window.bordered(),
--         documentation = cmp.config.window.bordered(),
--     },
--     sources = {
--         { name = 'nvim_lsp' },
--     },
--     snippet = {
--         expand = function(args)
--             vim.snippet.expand(args.body)
--         end,
--     },
--     mapping = cmp.mapping.preset.insert({
--         -- `Enter` key to confirm completion
--         ['<CR>'] = cmp.mapping.confirm({ select = false }),
--
--         -- Ctrl+Space to trigger completion menu
--         ['<C-Space>'] = cmp.mapping.complete(),
--
--         ['<Tab>'] = cmp_action.tab_complete(),
--         ['<S-Tab>'] = cmp.mapping.select_prev_item({ behaviour = 'select' }),
--     }),
-- })
--
-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--     ensure_installed = { 'clangd', 'lua_ls' },
--     handlers = {
--         function(server_name)
--             require('lspconfig')[server_name].setup({})
--         end,
--
--         -- server setups go here
--         clangd = function()
--             require('lspconfig').clangd.setup({
--             })
--         end,
--
--         lua_ls = function()
--             require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())
--         end,
--         --
--     },
-- })

    --require("lspconfig").setup({

local M = {}
function M.setup()
    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })


    local lspconfig = require("lspconfig")
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    lspconfig.clangd.setup({
        capabilities = capabilities,
    })

    lspconfig.lua_ls.setup({
        capabilities = capabilities,
    })

    lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
  capabilities = capabilities,
}
lspconfig.buf_ls.setup({})
end


--})
return M
