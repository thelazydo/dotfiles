return {
	-- 1. Catppuccin (most popular)
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			transparent_background = true,
			integrations = {
				mini = {
					enabled = true,
				},
				snacks = true,
			},
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					information = { "italic" },
					warnings = { "italic" },
				},
				underlines = {
					errors = { "undercurls" },
					hints = { "undercurls" },
					information = { "undercurls" },
					warnings = { "undercurls" },
				},
			},
		},
	},

	-- 2. Tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = { style = "storm", transparent = true, terminal_colors = true },
	},

	-- 3 Kanagawa
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		opts = {
			compile = false, -- enable compiling the colorscheme
			undercurl = true, -- enable undercurls
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = true, -- do not set background color
			dimInactive = false, -- dim inactive window `:h hl-NormalNC`
			terminalColors = true, -- define vim.g.terminal_color_{0,17}
			colors = { -- add/modify theme and palette colors
				palette = {},
				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
			},
			overrides = function(colors) -- add/modify highlights
				return {
					LineNr = { bg = "NONE", ctermbg = "NONE" },
					NormalFloat = { bg = "NONE" },
					FloatBorder = { fg = colors.theme.ui.special, bg = "NONE" },
				}
			end,
			theme = "wave", -- Load "wave" theme
			background = { -- map the value of 'background' option to a theme
				dark = "wave", -- try "dragon" !
				light = "lotus",
			},
		},
	},

	-- 4. Nightfox
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
		opts = { options = { transparent = true, styles = { comments = "italic" } } },
	},

	-- 5. Gruvbox Material
	{
		"sainnhe/gruvbox-material",
		opts = { overrides = { Normal = { bg = "NONE" }, NormalFloat = { bg = "NONE" } } },
		lazy = true,
		config = function(_, opts)
			-- Gruvbox uses vim.g variables for themes
			vim.g.gruvbox_material_background = "medium"
			for group, hl in pairs(opts.overrides) do
				vim.api.nvim_set_hl(0, group, hl)
			end
		end,
	},
}
