vim.pack.add({
	{ src = "https://github.com/folke/flash.nvim" },
})
local utils = require("utils")

utils.lazy_load_event("flash.nvim", { "BufReadPost" }, function()
	require("flash").setup()
end)

-- stylua: ignore
local keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
}

utils.map_plugin_keys(keys)
