vim.pack.add({
	"https://github.com/folke/tokyonight.nvim", 
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" }
})

require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	integrations = {
		bufferline = true,
	}
})
vim.cmd.colorscheme "catppuccin"

