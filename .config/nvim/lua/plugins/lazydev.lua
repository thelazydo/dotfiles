vim.pack.add({
	{ src = "https://github.com/folke/lazydev.nvim", name = "lazydev" },
})

require("utils").lazy_load_ft("lazydev", "lua", function()
	require("lazydev").setup({
		library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			{ path = "snacks.nvim", words = { "Snacks" } },
			{ path = "lazy.nvim", words = { "LazyVim" } },
			{ path = "nvim-lspconfig", words = { "lspconfig.settings" } },
		},
		integrations = {
			lspconfig = true,
			cmp = true,
		},
	})
end)
