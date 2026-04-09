vim.pack.add({
    { src = 'https://github.com/rafamadriz/friendly-snippets' },
    { src = "https://github.com/saghen/blink.cmp",            version = "1.*", name = "blink" }
})

local blink = require('blink.cmp')

blink.setup({
    keymap = { preset = 'default' },
    appearance = {
        nerd_font_variant = 'mono'
    },
    completion = {
        trigger = { prefetch_on_insert = false },
        accept = {
            auto_brackets = {
                enabled = false,
            },

        },
        menu = {
            border = "rounded",
            draw = {
                gap = 2
            }
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
            window = { border = "rounded" }
        }
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = { enabled = true },
})
