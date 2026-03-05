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
        cond = function()
            return #vim.api.nvim_list_uis() > 0
        end,
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
            image = { enabled = true },
        },
        keys = {
            -- Top Pickers & Explorer
            { "<leader>fs", function() Snacks.picker.smart() end,   desc = "Smart Find Files" },
            { "<leader>fg", function() Snacks.picker.grep() end,    desc = "Grep" },
            { "<leader>ff", function() Snacks.picker.files() end,   desc = "Find Files" },
            { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        },
    },

    { "xzbdmw/colorful-menu.nvim" },
    {
        'nvim-java/nvim-java',
        lazy = false,
        priority = 1002,
        cond = function()
            return #vim.api.nvim_list_uis() > 0
        end,
        config = function()
            require('java').setup({})
        end,
    },
    { 'echasnovski/mini.nvim',    version = false },
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
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        }
    },
    {
        'mfussenegger/nvim-dap'
    },
    { "theHamsta/nvim-dap-virtual-text", opts = {}, dependencies = { "mfussenegger/nvim-dap" } },
    { "rcarriga/nvim-dap-ui",           dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
    -- { 'thedenisnikulin/vim-cyberpunk' },
    { "catppuccin/nvim",                name = "catppuccin",                                                priority = 1000 },
    { 'nvim-treesitter/nvim-treesitter' },
    { 'mbbill/undotree' },
    {
        url = "https://codeberg.org/andyg/leap.nvim",
        dependencies = { "tpope/vim-repeat" },
    },
    { 'tpope/vim-fugitive' },
    -- Highlight git changes in statuscol
    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "petertriho/nvim-scrollbar" },
    },
    { 'tzachar/local-highlight.nvim' },
    { 'akinsho/toggleterm.nvim',     version = "*", config = true },
    {
        'stevearc/dressing.nvim',
        opts = {},
    },
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            --config here
        }
    },
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope.nvim' }
        }
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = "cd app && npm install --no-package-lock && cd .. && git checkout -- app/yarn.lock",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
    },
    -- Mason package manager for lsp servers, dap, etc.
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "cmake",
                    "basedpyright",
                    "dockerls",
                    "jsonls",
                    "clangd",
                    "buf_ls",
                    "marksman",
                },
                -- Prevent duplicate LSP clients: servers are configured manually below.
                automatic_enable = false,
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
                    javascript = { "prettierd", "prettier", stop_after_first = true },
                    typescript = { "prettierd", "prettier", stop_after_first = true },
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
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            local navic = require("nvim-navic")
            local py_root_markers = {
                ".git",
                ".gitignore",
                ".gimodules",
                ".gitlab-ci.yml",
                ".pre-commit-config.yml",
                ".pre-commit-config.yaml",
                "setup.py",
                "main.py",
                "setup.cfg",
                "pyproject.toml",
                "requirements.txt",
            }

            local function format_buffer()
                local ok, conform = pcall(require, "conform")
                if ok then
                    conform.format({ async = true, lsp_fallback = true })
                else
                    vim.lsp.buf.format({ async = true })
                end
            end

            local function basedpyright_root_dir(bufnr, on_dir)
                local fname = vim.api.nvim_buf_get_name(bufnr)
                local start_dir = fname ~= "" and vim.fs.dirname(fname) or vim.fn.getcwd()
                local found = vim.fs.find(py_root_markers, { upward = true, path = start_dir })[1]
                on_dir(found and vim.fs.dirname(found) or start_dir)
            end

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
                callback = function(args)
                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then return end

                    if client:supports_method('textDocument/documentSymbol') then
                        navic.attach(client, bufnr)
                    end
                    if client:supports_method('textDocument/inlayHint') then
                        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                    end

                    local opts = { buffer = bufnr }
                    vim.keymap.set('n', 'K', function()
                        if vim.bo.filetype == "rust" then
                            vim.cmd.RustLsp({ 'hover', 'actions' })
                        else
                            vim.lsp.buf.hover()
                        end
                    end, opts)
                    vim.keymap.set('n', 'gd', function()
                        if pcall(require, "snacks") then
                            Snacks.picker.lsp_definitions({ include_declaration = false })
                        else
                            vim.lsp.buf.definition()
                        end
                    end, opts)
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', 'gr', function()
                        if pcall(require, "snacks") then
                            Snacks.picker.lsp_references({ include_declaration = false })
                        else
                            vim.lsp.buf.references()
                        end
                    end, opts)
                    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'x' }, '<F3>', format_buffer, opts)
                    vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
                end,
            })

            vim.lsp.config('*', { capabilities = capabilities })
            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })
            vim.lsp.config('clangd', {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=never",
                    "--offset-encoding=utf-16",
                },
            })
            vim.lsp.config('dockerls', {})
            vim.lsp.config('jsonls', {})
            vim.lsp.config('cmake', {})
            vim.lsp.config('buf_ls', {})
            vim.lsp.config('marksman', {
                filetypes = { 'markdown' },
            })
            vim.lsp.config('basedpyright', {
                single_file_support = true,
                root_dir = basedpyright_root_dir,
                settings = {
                    pyright = {
                        disableLanguageServices = false,
                        disableOrganizeImports = false,
                    },
                    python = {
                        analysis = {
                            exclude = { "**/__pycache__/**", "**/.git/**" },
                            autoImportCompletions = true,
                            autoSearchPaths = true,
                            diagnosticMode = "openFilesOnly", -- openFilesOnly, workspace
                            typeCheckingMode = "basic",       -- off, basic, strict
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            })

            vim.lsp.enable({
                'lua_ls',
                'clangd',
                'dockerls',
                'jsonls',
                'cmake',
                'buf_ls',
                'marksman',
                'basedpyright',
            })
        end
    },

    -- clangd extensions (such as inlay hints)
    {
        "p00f/clangd_extensions.nvim",
        dependencies = "neovim/nvim-lspconfig",
    },

    -- rust
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false,   -- This plugin is already lazy
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
