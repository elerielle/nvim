local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
	  "git",
	  "clone",
	  "--filter=blob:none",
	  "https://github.com/folke/lazy.nvim.git",
	  "--branch=stable", -- latest stable release
	  lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim'}
	},
    {'nvim-tree/nvim-web-devicons'},
	--{'navarasu/onedark.nvim'},
    -- {
    --     'folke/tokyonight.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    -- },
    -- {
    --     "scottmckendry/cyberdream.nvim",
    --     lazy = false,
    --     priority = 1000,
    -- },
    {'thedenisnikulin/vim-cyberpunk'},
	{'nvim-treesitter/nvim-treesitter'},
    {'mbbill/undotree'},
    {'tpope/vim-fugitive'},
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    },
    {'xiyaowong/transparent.nvim'},
    {'Pocco81/auto-save.nvim',
    config = function()
        require("auto-save").setup {
            -- your config goes here
            -- or just leave it empty :)
        }
    end,}
}

local opts = {}

require("lazy").setup(plugins, opts)
