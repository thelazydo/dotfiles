-- TODO: Review and implement dependency backed loading util
vim.pack.add({})
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})
vim.cmd("packadd plenary.nvim")
vim.cmd("colorscheme catppuccin-nvim")
-- Plugin Pack
require("plugins.mini")
require("plugins.snacks")

-- General
require("plugins.lspconfig")
require("plugins.treesitter")
require("plugins.neotest")
require("plugins.dap")
require("plugins.lazydev")
require("plugins.conform")
require("plugins.which_key")

-- require("plugins.oil")

-- Language specific
require("plugins.c_c++")
require("plugins.js_ts")
require("plugins.python")
require("plugins.rust")

-- UI
require("plugins.tabscope")
require("plugins.transparent")

-- AI
require("plugins.codecompanion")
require("plugins.minute")

-- DB
require("plugins.vi-mongo")

-- Utility
require("plugins.rename")
require("plugins.ts-tags")

require("plugins.grug-gar")
require("plugins.pomodoro")
require("plugins.curl")
require("plugins.cloak")
require("plugins.wakatime")
require("plugins.obsidian")
