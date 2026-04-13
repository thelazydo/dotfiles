vim.pack.add({
	"https://github.com/windwp/nvim-ts-autotag",
})
local utils = require("utils")
utils.lazy_load_event("nvim-ts-autotag", { "BufReadPre", "BufNewFile" }, function()
	require("nvim-ts-autotag").setup({
		opts = {
			enable_close = true, -- Auto close tags
			enable_rename = true, -- Auto rename pairs of tags
			enable_close_on_slash = false, -- Auto close on trailing </
		},
		-- Also override individual filetype configs, these take priority.
		-- Empty by default, useful if one of the "opts" global settings
		-- doesn't work well in a specific filetype
		per_filetype = {
			["html"] = {
				enable_close = false,
			},
		},
	})
end)
