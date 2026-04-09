vim.pack.add({
    { src = "https://github.com/laytan/cloak.nvim", name = "cloak.nvim" }
})

local keys = {
    { "<leader>cK", "<cmd>CloakToggle<cr>",      mode = { "n" }, desc = "Toggle Cloak", },
    { "<leader>ck", "<cmd>CloakPreviewLine<cr>", mode = { "n" }, desc = "Enable Cloak Preview", }
}

-- require("cloak.nvim").setup({})
require("utils").map_plugin_keys(keys)
