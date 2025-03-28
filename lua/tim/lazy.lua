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
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
         opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            dashboard = { enabled = true },
            input = { enabled = true },
            picker = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            image = {enabled = true},
        },
        keys = {
            -- Top Pickers & Explorer
            { "<leader>fs", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
            { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
            { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
            { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        },
    },

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
    -- Mason package manager for lsp servers, dap, etc.
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "cmake",
                    "basedpyright",
                    "dockerls",
                    "jsonls",
                    "clangd",
                    "jdtls",
                    "buf_ls",
                    "marksman",
                },
                automatic_installation = true,
            })
        end,
        cond = not vim.g.vscode,
    },

    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
        cond = not vim.g.vscode,
    },

    -- Formatters
    {
      "stevearc/conform.nvim",
      config = function()
        require("conform").setup({
          formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            javascript = { { "prettierd", "prettier" } },
            typescript = { { "prettierd", "prettier" } },
            cpp = { "clang-format" },
            c = { "clang-format" },
            cmake = { "cmake-format" },
            sh = { "shfmt" },
            just = { "just" },
            markdown = { "prettier" },
            yaml = { "prettier" },
            rust = { "rustfmt" },
            html = { "prettier" },
            xml = { "xmlformat" },
            haskell = { "ormolu" },
          },
          formatters = {
            rustfmt = { command = "cargo fmt" },
          },
          -- format_on_save = {
          --   -- These options will be passed to conform.format()
          --   timeout_ms = 500,
          --   lsp_fallback = true,
          -- },
        })
      end,
      cond = not vim.g.vscode,
    },

    -- {
    --     'neovim/nvim-lspconfig',
    --     dependencies = {
    --         'saghen/blink.cmp' ,
    --         'williamboman/mason.nvim' ,
    --         'williamboman/mason-lspconfig.nvim'  ,
    --     },
    --
    -- },

    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp' },

        -- example using `opts` for defining servers
        opts = {
            servers = {
                lua_ls = {}
            }
        },

        -- example calling setup directly for each LSP
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            local lspconfig = require('lspconfig')

            lspconfig['lua_ls'].setup({ capabilities = capabilities })
            lspconfig['clangd'].setup({capabilities = capabilities})
        end
    },

    -- clangd extensions (such as inlay hints)
    {
      "p00f/clangd_extensions.nvim",
      dependencies = "neovim/nvim-lspconfig",
    },

     -- Inlay hints for various language servers
    {
      "lvimuser/lsp-inlayhints.nvim",
      config = function()
        require("lsp-inlayhints").setup({
          inlay_hints = {
            parameter_hints = {
              show = true,
              prefix = "<- ",
              separator = ", ",
              remove_colon_start = false,
              remove_colon_end = true,
            },
            type_hints = {
              show = true,
              prefix = "",
              separator = ", ",
              remove_colon_start = false,
              remove_colon_end = true,
            },
            only_current_line = false,
            labels_separator = "  ",
            max_len_align = false,
            max_len_align_padding = 1,
            highlight = "LspInlayHint",
            priority = 0,
          },
          enabled_at_startup = true,
          debug_mode = false,
        })
      end,
      cond = not vim.g.vscode,
    },

    -- rust
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false, -- This plugin is already lazy
    },

    -- rust crates
    {
      "saecki/crates.nvim",
      dependencies = "mrcjkb/rustaceanvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("crates").setup()
      end,
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
