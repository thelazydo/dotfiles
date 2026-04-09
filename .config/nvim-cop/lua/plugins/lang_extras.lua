return {
	-- Rust
	{
		"mrcjkb/rustaceanvim",
		version = "^9", -- Recommended
		lazy = false, -- This plugin is already lazy
	},

	-- Python
	{
		"linux-cultist/venv-selector.nvim",
		branch = "main",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap-python",
		},
		opts = {
			settings = {
				options = {
					notify_user_on_venv_activation = true,
				},
			},
		},
		ft = "python",
		keys = {
			{ "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
		},
	},

	-- C/C++
	{
		"p00f/clangd_extensions.nvim",
		lazy = true,
		config = function() end,
		opts = {
			inlay_hints = {
				inline = false,
			},
			ast = {
				--These require codicons (https://github.com/microsoft/vscode-codicons)
				role_icons = {
					type = "",
					declaration = "",
					expression = "",
					specifier = "",
					statement = "",
					["template argument"] = "",
				},
				kind_icons = {
					Compound = "",
					Recovery = "",
					TranslationUnit = "",
					PackExpansion = "",
					TemplateTypeParm = "",
					TemplateTemplateParm = "",
					TemplateParamObject = "",
				},
			},
		},
	},

	-- TypeScript/JavaScript
	{
		"vuki656/package-info.nvim",
		enabled = false,
		dependencies = { "MunifTanjim/nui.nvim" },
		event = "BufRead package.json",
		opts = {},
		keys = {
			{ "<leader>ps", "<cmd>PackageInfoShow<cr>", desc = "Show Package Info" },
			{ "<leader>ph", "<cmd>PackageInfoHide<cr>", desc = "Hide Package Info" },
			{ "<leader>pc", "<cmd>PackageInfoChangeVersion<cr>", desc = "Change Package Version" },
			{ "<leader>pt", "<cmd>PackageInfoToggle<cr>", desc = "Change Package Version" },
			{ "<leader>pd", "<cmd>PackageInfoDelete<cr>", desc = "Delete Package" },
			{ "<leader>pu", "<cmd>PackageInfoUpdate<cr>", desc = "Update Package" },
			{ "<leader>pi", "<cmd>PackageInfoInstall<cr>", desc = "Install Package" },
		},
	},
}
