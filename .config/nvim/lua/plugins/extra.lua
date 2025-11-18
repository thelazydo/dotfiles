return {

	{
		"nvim-flutter/flutter-tools.nvim",
		enabled = false,
		dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
		config = function()
			vim.keymap.set("n", "<leader>flr", "<cmd>FlutterRestart<CR>", { desc = "Flutter Restart" })
			vim.keymap.set("n", "<leader>fls", "<cmd>FlutterRun<CR>", { desc = "Flutter Run" })
			require("flutter-tools").setup({
				-- (uncomment below line for windows only)
				-- flutter_path = "home/flutter/bin/flutter.bat",

				debugger = {
					-- make these two params true to enable debug mode
					enabled = true,
					run_via_dap = true,
					register_configurations = function(_)
						require("dap").adapters.dart = {
							type = "executable",
							command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
							args = { "flutter" },
						}

						require("dap").configurations.dart = {
							{
								type = "dart",
								request = "launch",
								name = "Launch flutter",
								dartSdkPath = "home/flutter/bin/cache/dart-sdk/",
								flutterSdkPath = "home/flutter",
								program = "${workspaceFolder}/lib/main.dart",
								cwd = "${workspaceFolder}",
							},
						}
						-- uncomment below line if you've launch.json file already in your vscode setup
						-- require("dap.ext.vscode").load_launchjs()
					end,
				},
				dev_log = {
					-- toggle it when you run without DAP
					enabled = false,
					open_cmd = "tabedit",
				},
				lsp = {
					on_attach = require("vim.lsp").common_on_attach,
					capabilities = require("vim.lsp").default_capabilities,
				},
			})
		end,
	},
	-- for dart syntax hightling
	{
		enabled = false,
		"dart-lang/dart-vim-plugin",
	},
	{
		"seblyng/roslyn.nvim",
		enabled = false,
		ft = { "cs" },
		requires = { "nvim-lua/plenary.nvim" },
		--@module 'roslyn.config'
		--@type RoslynNvimConfig
		opts = {
			dotnet_cmd = "dotnet",
			settings = {
				["csharp|inlay_hints"] = {
					csharp_enable_inlay_hints_for_implicit_object_creation = true,
					csharp_enable_inlay_hints_for_implicit_variable_types = true,
					csharp_enable_inlay_hints_for_lambda_parameter_types = true,
					csharp_enable_inlay_hints_for_types = true,
					dotnet_enable_inlay_hints_for_indexer_parameters = true,
					dotnet_enable_inlay_hints_for_literal_parameters = true,
					dotnet_enable_inlay_hints_for_object_creation_parameters = true,
					dotnet_enable_inlay_hints_for_other_parameters = true,
					dotnet_enable_inlay_hints_for_parameters = true,
					dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
					dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
					dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
				},
				["csharp|code_lens"] = {
					dotnet_enable_references_code_lens = true,
					dotnet_enable_tests_code_lens = true,
				},
				["csharp|completion"] = {
					dotnet_show_completion_items_from_unimported_namespaces = true,
					dotnet_show_name_completion_suggestions = true,
				},
				["csharp|background_analysis"] = {
					background_analysis_dotnet_compiler_diagnostics_scope = "fullSolution",
					background_analysis_dotnet_analyzers_diagnostics_scope = "fullSolution",
				},
				["csharp|symbol_search"] = {
					dotnet_search_reference_assemblies = true,
				},
			},
		},
	},
	{
		"Pheon-Dev/pigeon",
		enabled = false,
		opts = {
			enabled = true,
			os = "osx", -- windows, osx
			plugin_manager = "lazy", -- packer, paq, vim-plug
			callbacks = {
				killing_pigeon = nil,
				respawning_pigeon = nil,
			},
		},
	},
	{
		"mistricky/codesnap.nvim",
    enabled=false,
		build = "make build_generator",
		keys = {
			{ "<leader>xX", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
			{
				"<leader>xx",
				"<cmd>CodeSnapSave<cr>",
				mode = "x",
				desc = "Save selected code snapshot in ~/Desktop/codesnapx/",
			},
		},
		opts = {
			save_path = "~/Desktop/codesnapx/",
			has_breadcrumbs = true,
			bg_theme = "bamboo",
		},
	},

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		enabled = false,
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		keys = {
			{
				"<leader>aq",
				function()
					vim.ui.input({
						prompt = "Quick Chat: ",
					}, function(input)
						if input ~= "" then
							require("CopilotChat").ask(input)
						end
					end)
				end,
				desc = "Quick Chat (CopilotChat)",
				mode = { "n", "v" },
			},
			{
				"<leader>al",
				function()
					vim.ui.input({ prompt = "Enter chat name: " }, function(chat_name)
						if not chat_name or chat_name == "" then
							print("No chat name provided.")
							return
						end
						print(chat_name)
						vim.cmd("CopilotChatLoad " .. vim.fn.fnameescape(chat_name))
					end)
				end,
				mode = { "n" },
				desc = "Load CopilotChat",
			},

			{
				"<leader>as",
				function()
					vim.ui.input({ prompt = "Enter chat name: " }, function(chat_name)
						if not chat_name or chat_name == "" then
							print("No chat name provided.")
							return
						end
						print(chat_name)
						vim.cmd("CopilotChatSave " .. vim.fn.fnameescape(chat_name))
					end)
				end,
				mode = { "n" },
				desc = "Save CopilotChat",
			},

			{ "<leader>ap", "<cmd>CopilotChatPrompts<cr>", desc = "CopilotChat Prompts" },
			{ "<leader>am", "<cmd>CopilotChatModels<cr>", desc = "CopilotChat Models" },
			{ "<leader>ac", "<cmd>CopilotChat<cr>", desc = "CopilotChat" },
			{ "<leader>at", "<cmd>CopilotChatToggle<cr>", desc = "Toggle (CopilotChat)" },
			{ "<leader>ax", "<cmd>CopilotChatStop<cr>", desc = "CopilotChat Stop" },
			{ "<leader>az", "<cmd>CopilotChatReset<cr>", desc = "Reset (CopilotChat)" },
		},

		opts = {
			model = "gpt-4.1", -- AI model to use
			temperature = 0.1, -- Lower = focused, higher = creative
			auto_insert_mode = true, -- Enter insert mode when opening
			window = {
				layout = "float",
				-- width = 80, -- Fixed width in columns
				-- height = 20, -- Fixed height in rows

				width = math.floor(vim.o.columns * 0.8),
				height = math.floor(vim.o.lines * 0.8),
				border = "rounded", -- 'single', 'double', 'rounded', 'solid'
				title = "🤖 AI Assistant",
				zindex = 100, -- Ensure window stays on top
			},

			headers = {
				user = "👤 You: ",
				assistant = "🤖 Copilot: ",
				tool = "🔧 Tool: ",
			},
			separator = "━━",
			show_folds = false, -- Disable folding for cleaner look
		},
	},
-- Commented out to avoid disabling base blink.cmp
--	{
--		"saghen/blink.cmp",
--		enabled = false,
--		dependencies = {
--			"fang2hou/blink-copilot",
--		},
--		opts = {
--			sources = {
--				default = { "copilot" },
--				providers = {
--					copilot = {
--						name = "copilot",
--						module = "blink-copilot",
--						score_offset = 100,
--						async = true,
--					},
--				},
--			},
--		},
--	},
	{
		"fang2hou/blink-copilot",
		enabled = false,
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function(_, opts)
			opts = vim.tbl_extend("force", {
				max_completions = 3,
				debounce = 200,
				auto_refresh = { backward = true, forward = true },
			}, opts or {})
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		enabled = false,
		event = "InsertEnter",
		build = false,
		keys = {
			-- clmpqstxz
			{ "<leader>aa", "<cmd>Copilot auth<cr>", desc = "Copilot auth" },
			{ "<leader>aX", "<cmd>Copilot disable<cr>", desc = "Copilot disable" },
			{ "<leader>ae", "<cmd>Copilot enable<cr>", desc = "Copilot enable" },
			{ "<leader>aV", "<cmd>Copilot version<cr>", desc = "Copilot version" },
			{ "<leader>aP", "<cmd>Copilot panel<cr>", desc = "Copilot open panel" },
			{ "<leader>aS", "<cmd>Copilot status<cr>", desc = "Copilot show status" },
			{ "<leader>aG", "<cmd>Copilot suggestion<cr>", desc = "Copilot suggestion" },
			{ "<leader>aT", "<cmd>Copilot toggle<cr>", desc = "Copilot toggle" },
			{ "<leader>aA", "<cmd>Copilot attach<cr>", desc = "Copilot attach" },
			{ "<leader>aD", "<cmd>Copilot detach<cr>", desc = "Copilot detach" },
		},
		opts = {
			suggestion = {
				enabled = false,
				auto_trigger = false,
			},
			panel = { enabled = false },
			filetypes = {},
		},
	},
	{
		enabled = false,
		"augmentcode/augment.vim",
		keys = {
			-- Basic commands
			{ "<leader>au", "<cmd>Augment status<cr>", desc = "Show Augment Status" },
			{ "<leader>ac", "<cmd>Augment chat<cr>", desc = "Start Chat" },
			{ "<leader>aC", "<cmd>Augment chat-toggle<cr>", desc = "Toggle Chat Window" },
			{ "<leader>an", "<cmd>Augment chat-new<cr>", desc = "New Chat Session" },
			{ "<leader>as", "<cmd>Augment signin<cr>", desc = "Sign In to Augment" },
			{ "<leader>ao", "<cmd>Augment signout<cr>", desc = "Sign Out from Augment" },
			{ "<leader>aX", "<cmd>Augment disable<cr>", desc = "Disable Augment" },
			{ "<leader>ax", "<cmd>Augment enable<cr>", desc = "Enable Augment" },
		},
	},
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		enabled = false,
		config = function()
			require("chatgpt").setup()
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim", -- optional
			"nvim-telescope/telescope.nvim",
		},
	},
}
