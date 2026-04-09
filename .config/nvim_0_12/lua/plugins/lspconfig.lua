vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/mason-org/mason.nvim' },
})
require("mason").setup({
    ensure_installed = {
        "pyright",
        "lua_ls",
        "vtsls",
        "ruff",
        "gopls"
    },


    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

vim.lsp.enable({ "pyright", "lua_ls", "vtsls", "ruff", "gopls","rust_analyzer" })
vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
})
