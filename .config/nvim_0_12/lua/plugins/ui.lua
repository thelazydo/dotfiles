vim.pack.add({
    "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/rcarriga/nvim-notify",
    "https://github.com/folke/noice.nvim"
})
local notify = require("notify")

notify.setup({
    merge_duplicates=true,
    background_colour = "#000000",
    -- Animation style: 'fade', 'slide', 'fade_in_slide_out', or 'static'
    stages = "fade_in_slide_out",
    -- How long notifications stay on screen (in milliseconds)
    timeout = 3000,
    -- Set this to your terminal background if you get weird visual artifacts
    -- background_colour = "#000000",
    -- Maximum width of the notification window
    max_width = math.floor(vim.api.nvim_win_get_width(0) / 2),
    -- Icons for different log levels (requires a Nerd Font)
    icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
    },
})

-- Override Neovim's default notify function globally
vim.notify = notify

-- Dismiss all active and pending notifications
vim.keymap.set("n", "<leader>nd", function() require("notify").dismiss({ pending = true, silent = true }) end,
    { desc = "Dismiss All Notifications" })


require("noice").setup({
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
    },
    -- you can enable a preset for easier configuration
    presets = {
        bottom_search = true,     -- use a classic bottom cmdline for search
        command_palette = true,   -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,       -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,   -- add a border to hover docs and signature help
    },
})
