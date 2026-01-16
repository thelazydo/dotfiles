return {

	{
		"milanglacier/minuet-ai.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {

			virtual_text = {
				auto_trigger_ft = { "*" },
				keymap = {
					-- Press 'Tab' to accept the ghost text
					accept = "<Tab>",
					accept_line = "<C-a>",
					-- Cycle through suggestions if multiple are generated
					prev = "<C-p>",
					next = "<C-n>",
					dismiss = "<Escape>",
				},
			},

			provider = "openai_fim_compatible",
			request_timeout = 10,
			throttle = 1500,
			debounce = 600,
			n_completions = 1, -- recommend for local model for resource saving
			-- I recommend beginning with a small context window size and incrementally
			-- expanding it, depending on your local computing power. A context window
			-- of 512, serves as an good starting point to estimate your computing
			-- power. Once you have a reliable estimate of your local computing power,
			-- you should adjust the context window to a larger value.
			context_window = 512,
			provider_options = {
				openai_fim_compatible = {
					-- For Windows users, TERM may not be present in environment variables.
					-- Consider using APPDATA instead.
					api_key = "OLLAMA",
					name = "Ollama",
					end_point = "http://localhost:11434/v1/completions",
					model = "qwen2.5-coder:3b",
					optional = {
						max_tokens = 56,
						top_p = 0.9,
					},
				},
			},
		},
	},
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
