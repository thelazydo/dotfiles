return {
	{
		"gbprod/substitute.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local substitute = require("substitute")

			substitute.setup()

			-- set keymaps
			local keymap = vim.keymap -- for conciseness

			keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion" })
			keymap.set("n", "ss", substitute.line, { desc = "Substitute line" })
			keymap.set("n", "S", substitute.eol, { desc = "Substitute to end of line" })
			keymap.set("x", "s", substitute.visual, { desc = "Substitute in visual mode" })
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			ignore = function(buf)
				local name = vim.api.nvim_buf_get_name(buf)
				print(name)
				vim.notify(name, 2)
				return string.find(name, "~/tldo/") ~= nil
			end,
		},
	},
	{
		"smjonas/inc-rename.nvim",
		keys = {
			{
				"<leader>cr",
				function()
					return ":IncRename " .. vim.fn.expand("<cword>")
				end,
				mode = { "n", "v" },
				expr = true,
				desc = "Inc Rename",
			},
		},
		opts = {
			input_buffer_type = "snacks",
		},
	},

	{
		"windwp/nvim-ts-autotag",
		event = "VeryLazy",
		opts = {},
	},
	{
		"MagicDuck/grug-far.nvim",
		opts = { headerMaxWidth = 80 },
		cmd = "GrugFar",
		keys = {
			{
				"<leader>sr",
				function()
					local grug = require("grug-far")
					local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
					grug.open({
						transient = true,
						prefills = {
							filesFilter = ext and ext ~= "" and "*." .. ext or nil,
						},
					})
				end,
				mode = { "n", "v" },
				desc = "Search and Replace",
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
        -- stylua: ignore
        keys = {
            { "]t",         function() require("todo-comments").jump_next() end, desc = "Next Todo Comment",     },
            { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment", },
            { "<leader>xt", "<cmd>Trouble todo toggle<cr>",                      desc = "Todo (Trouble)" },      { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO, FIX, FIXME}}<cr>", desc = "Todo/Fix/Fixme (Trouble)", },
        },
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
    -- stylua: ignore
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",                        desc = "Diagnostics (Trouble)",                        },
            { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",           desc = "Buffer Diagnostics (Trouble)",                 },
            { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",                desc = "Symbols (Trouble)",                            },
            { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)", },
            { "<leader>xL", "<cmd>Trouble loclist toggle<cr>",                            desc = "Location List (Trouble)",                      },
            { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",                             desc = "Quickfix List (Trouble)",                      },
        },
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			sort = { "alphanum", "local", "order", "group", "mod" },
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			-- "fang2hou/blink-copilot",
		},
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "default" },
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				menu = {
					border = "rounded",
					draw = {
						gap = 2,
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
					window = {
						border = "rounded",
					},
				},
			},
			sources = {
				default = {
					-- "copilot",
					"lazydev",
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
					-- copilot = {
					-- 	name = "copilot",
					-- 	module = "blink-copilot",
					-- 	score_offset = 100,
					-- 	async = true,
					-- },
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
			signature = { enabled = true },
		},
		opts_extend = { "sources.default" },
	},
}
