require("blink.cmp").setup({

    keymap = {
        preset = 'super-tab',
        -- ['<Tab>'] = {'accept', 'fallback'},
        -- ['<C-Tab>'] = { 'select_next', 'snippet_forward', 'fallback'},
        -- ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback'},
    },

    completion = {
        menu = {
            draw = {
                -- We don't need label_description now because label and label_description are already
                -- combined together in label by colorful-menu.nvim.
                columns = { { "kind_icon" }, { "label", gap = 1 } },
                components = {
                    label = {
                        text = function(ctx)
                            return require("colorful-menu").blink_components_text(ctx)
                        end,
                        highlight = function(ctx)
                            return require("colorful-menu").blink_components_highlight(ctx)
                        end,
                    },
                },
            },
        },
    },
    --     completion = 
    --     {
    --         -- 'prefix' will fuzzy match on the text before the cursor
    --         -- 'full' will fuzzy match on the text before *and* after the cursor
    --         -- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
    --         keyword = { range = 'full' },
    --
    --         -- Disable auto brackets
    --         -- NOTE: some LSPs may add auto brackets themselves anyway
    --         accept = { auto_brackets = { enabled = false }, },
    --
    --         -- Don't select by default, auto insert on selection    
    --         list = { selection = { preselect = false, auto_insert = true } },
    --         -- or set either per mode via a function
    --         list = { selection = { preselect = function(ctx) return ctx.mode ~= 'cmdline' end } 
    --     },
    -- },


    signature = { 
        window = {border = 'rounded' },
    },

    appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'normal'
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
            lazydev = {
                name = 'LazyDev',
                module = 'lazydev.integrations.blink',
                score_offset = 100,
            },
        },
    },

    -- config = function()
        --     require("blink.cmp").setup({
            --         completion = {
                --             menu = {
                    --                 draw = {
                        --                     -- We don't need label_description now because label and label_description are already
                        --                     -- combined together in label by colorful-menu.nvim.
                        --                     columns = { { "kind_icon" }, { "label", gap = 1 } },
                        --                     components = {
                            --                         label = {
                                --                             text = function(ctx)
                                    --                                 return require("colorful-menu").blink_components_text(ctx)
                                    --                             end,
                                    --                             highlight = function(ctx)
                                        --                                 return require("colorful-menu").blink_components_highlight(ctx)
                                        --                             end,
                                        --                         },
                                        --                     },
                                        --                 },
                                        --             },
                                        --         },
                                        --     })
                                        -- end

                                    })















--
--dav

-- require ("blink.cmp").setup({
--
--   signature = { enabled = true },
--
--   snippets = { preset = "luasnip" },
--
--   sources = {
--     default = { "lsp", "path", "snippets", "buffer", "copilot" },
--     providers = {
--       copilot = {
--         name = "copilot",
--         module = "blink-cmp-copilot",
--         score_offset = 100,
--         async = true,
--         transform_items = function(_, items)
--           local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
--           local kind_idx = #CompletionItemKind + 1
--           CompletionItemKind[kind_idx] = "Copilot"
--           for _, item in ipairs(items) do
--             item.kind = kind_idx
--           end
--           return items
--         end,
--       },
--     },
--   },
--
--   completion = {
--     menu = {
--       draw = {
--         columns = { { "item_idx" }, { "kind_icon" }, { "label", "label_description", gap = 1 } },
--         components = {
--           item_idx = {
--             text = function(ctx)
--               return tostring(ctx.idx)
--             end,
--             highlight = "BlinkCmpItemIdx", -- optional, only if you want to change its color
--           },
--         },
--       },
--     },
--   },
--
--   keymap = {
--     preset = "default",
--     ["<Tab>"] = {
--       function(cmp)
--         if cmp.snippet_active() then
--           return cmp.accept()
--         else
--           return cmp.select_and_accept()
--         end
--       end,
--       "snippet_forward",
--       "fallback",
--     },
--     ["<S-Tab>"] = { "snippet_backward", "fallback" },
--     ["<Up>"] = { "select_prev", "fallback" },
--     ["<Down>"] = { "select_next", "fallback" },
--     ["<A-1>"] = {
--       function(cmp)
--         cmp.accept({ index = 1 })
--       end,
--     },
--     ["<A-2>"] = {
--       function(cmp)
--         cmp.accept({ index = 2 })
--       end,
--     },
--     ["<A-3>"] = {
--       function(cmp)
--         cmp.accept({ index = 3 })
--       end,
--     },
--     ["<A-4>"] = {
--       function(cmp)
--         cmp.accept({ index = 4 })
--       end,
--     },
--     ["<A-5>"] = {
--       function(cmp)
--         cmp.accept({ index = 5 })
--       end,
--     },
--     ["<A-6>"] = {
--       function(cmp)
--         cmp.accept({ index = 6 })
--       end,
--     },
--     ["<A-7>"] = {
--       function(cmp)
--         cmp.accept({ index = 7 })
--       end,
--     },
--     ["<A-8>"] = {
--       function(cmp)
--         cmp.accept({ index = 8 })
--       end,
--     },
--     ["<A-9>"] = {
--       function(cmp)
--         cmp.accept({ index = 9 })
--       end,
--     },
--   },
--
--   appearance = {
--     nerd_font_variant = "mono",
--     kind_icons = {
--       Copilot = "",
--       Text = "󰉿",
--       Method = "󰊕",
--       Function = "󰊕",
--       Constructor = "󰒓",
--
--       Field = "󰜢",
--       Variable = "󰆦",
--       Property = "󰖷",
--
--       Class = "󱡠",
--       Interface = "󱡠",
--       Struct = "󱡠",
--       Module = "󰅩",
--
--       Unit = "󰪚",
--       Value = "󰦨",
--       Enum = "󰦨",
--       EnumMember = "󰦨",
--
--       Keyword = "󰻾",
--       Constant = "󰏿",
--
--       Snippet = "󱄽",
--       Color = "󰏘",
--       File = "󰈔",
--       Reference = "󰬲",
--       Folder = "󰉋",
--       Event = "󱐋",
--       Operator = "󰪚",
--       TypeParameter = "󰬛",
--     },
--   },
-- })
--
