vim.pack.add({
	"https://github.com/backdround/tabscope.nvim",
})
-- Initialize tabscope
require("tabscope").setup({})
-- To remove tab local buffer
vim.keymap.set("n", "<leader>bd", require("tabscope").remove_tab_buffer)
