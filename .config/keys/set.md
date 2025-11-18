local macWindows = {
	Maximize = { key = "LSpace-M" },
	-- Go full screen

	-- Put to Left, Right, Bottom, Top
	Position = {
		topleft = { key = "Ctrl-Cmd-H" },
		bottomright = { key = "Ctrl-Cmd-L" },
		topright = { key = "Ctrl-Cmd-K" },
		bottomLeft = { key = "Ctrl-Cmd-J" },

		left = { key = "LSpace-H" },
		bottom = { key = "LSpace-J" },
		top = { key = "LSpace-K" },
		Right = { key = "LSpace-L" },
	},

	-- Move window between Monitors
	Monitors = {
		samsung = {
			key = "LSpace-W",
		},
		builtIn = {
			key = "LSpace-S",
		},
	},

	-- Navigate between Virtual Desktops and Full Screens
	Navigate = {
		left = { key = "LSpace-A" },
		right = { key = "LSpace-D" },

		one = { key = "Ctrl-1" },
		two = { key = "Ctrl-2" },
		three = { key = "Ctrl-3" },
	},
}
