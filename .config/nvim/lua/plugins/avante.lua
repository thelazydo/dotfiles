return {
	{
		"olimorris/codecompanion.nvim",
		opts = {

			opts = {
				log_level = "DEBUG",
			},
			adapters = {
				http = {
					gemini = function()
						return require("codecompanion.adapters").extend("gemini", {
							schema = {
								model = {
									default = "gemini-3-pro-preview",
								},
							},
							env = {
								api_key = "GEMINI_API_KEY",
							},
						})
					end,
				},
			},
			strategies = {
				chat = {
					adapter = "gemini",
				},
				inline = {
					adapter = "gemini",
				},
				agent = {
					adapter = "gemini",
				},
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
}
