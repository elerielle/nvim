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
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "echasnovski/mini.icons" },
        opts = {}
    },
    { 'nvim-tree/nvim-web-devicons' },
    -- lazy.nvim
    -- {
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     opts = {
    --         -- add any options here
    --     },
    --     dependencies = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --         "rcarriga/nvim-notify",
    --     }
    -- },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "alfaix/neotest-gtest",
            "nvim-neotest/neotest-python",
            "mrcjkb/rustaceanvim",
            "rcasia/neotest-java",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        }
    },
    {
        "nvim-neorg/neorg",
        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*", -- Pin Neorg to the latest stable release
        config = true,
    },
    {
        'mfussenegger/nvim-dap'
    },
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    -- { 'thedenisnikulin/vim-cyberpunk' },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { 'nvim-treesitter/nvim-treesitter' },
    { 'mbbill/undotree' },
    { "ggandor/leap.nvim",
      dependencies = {"tpope/vim-repeat"},
    },
    { 'tpope/vim-fugitive' },
    -- Highlight git changes in statuscol
    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "petertriho/nvim-scrollbar" },
    },
    {      'tzachar/local-highlight.nvim'},
    -- {'edluffy/hologram.nvim'},
    -- {"3rd/image.nvim"},
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     main = "ibl",
    --     ---@module "ibl"
    --     ---@type ibl.config
    --     opts = {},
    -- },
    {
        'stevearc/dressing.nvim',
        opts = {},
    },
    {
        'folke/todo-comments.nvim',
        dependencies = {'nvim-lua/plenary.nvim'},
        opts = {
            --config here
        }
    },
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            {'nvim-telescope/telescope.nvim'}
        }
    },
    { 'Civitasv/cmake-tools.nvim' },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    },
    { 'xiyaowong/transparent.nvim' },
    {
        "folke/lazydev.nvim"
    },
    {
        "nvim-zh/colorful-winsep.nvim",
        config = true,
        event = { "WinLeave" },
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        }
    }
}

local opts = {}

require("lazy").setup(plugins, opts)
