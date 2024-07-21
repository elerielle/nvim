-- local lsp = require('lsp-zero').preset({})
local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})

    vim.keymap.set('n', '<leader>er', '<cmd>lua vim.lsp.buf.code_action()<CR>', {buffer = bufnr})
    vim.keymap.set('n', '<leader>re', '<cmd>lua vim.lsp.buf.rename()<CR>', {buffer = bufnr})
    vim.keymap.set('n', '<leader>fo', '<cmd> lua vim.lsp.buf.format()<CR>', {buffer = bufnr})

end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'clangd', 'lua_ls'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,


    -- server setups go here
    clangd = function()
        require('lspconfig').clangd.setup({
        })
    end,

    lua_ls = function()
        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
    end,
    --
  },
})

-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
  }
})
