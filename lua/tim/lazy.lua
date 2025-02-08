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

    {"xzbdmw/colorful-menu.nvim"},
    { 'echasnovski/mini.nvim', version = false },
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
    {'akinsho/toggleterm.nvim', version = "*", config = true},
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
    {
        'neovim/nvim-lspconfig',
        dependencies = { 
            'saghen/blink.cmp' ,
            'williamboman/mason.nvim' ,
            'williamboman/mason-lspconfig.nvim'  ,
        },
    },
    {
        'nvimdev/lspsaga.nvim'
    },
    { 'Civitasv/cmake-tools.nvim' },
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            { "L3MON4D3/LuaSnip", version = "v2.*" },
            "giuxtaposition/blink-cmp-copilot",
            "zbirenbaum/copilot.lua",
        },
        version = "*",
        -- build = "cargo build --release",
    },

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
