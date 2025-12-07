return {
	"nvim-mini/mini.nvim",
	version = "*",
	config = function()
		require("mini.tabline").setup()

		require("mini.pairs").setup()
		require("mini.icons").setup()
		require("mini.hipatterns").setup()
		require("mini.statusline").setup()
		require("mini.align").setup()
		require("mini.surround").setup({
			custom_surroundings = nil,
			highlight_duration = 500,
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
			-- Number of lines within which surrounding is searched
			n_lines = 20,
			respect_selection_type = false,
			search_method = "cover",
			silent = false,
		})
	end,
}
