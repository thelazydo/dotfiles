local wezterm = require("wezterm")
local resurrect_keys = require("resurrect")
local merge_tables = require("helpers").merge_tables

local action = wezterm.action
local action_callback = wezterm.action_callback

local system_keys = {
	-- Pane keys
	{ key = "0", mods = "LEADER", action = action.PaneSelect },
	-- Swap panes
	{ key = "}", mods = "LEADER", action = action.PaneSelect({ mode = "SwapWithActive" }) },
	{ key = "{", mods = "LEADER", action = action.PaneSelect({ mode = "SwapWithActiveKeepFocus" }) },

	-- Move Panes
	-- { key = "[", mods = "LEADER", action = action.PaneSelect({ mode = "MoveToNewWindow" }) },
	-- { key = "]", mods = "LEADER", action = action.PaneSelect({ mode = "MoveToNewTab" }) },
	--
	-- Close panes
	{ key = "x", mods = "LEADER", action = action.CloseCurrentPane({ confirm = true }) },

	-- Splits
	{ key = "\\", mods = "LEADER", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "-", mods = "LEADER", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- Reload config
	{ key = "r", mods = "LEADER", action = action.ReloadConfiguration },

	-- Resize panes
	{ key = "h", mods = "CTRL|SHIFT", action = action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "l", mods = "CTRL|SHIFT", action = action.AdjustPaneSize({ "Right", 6 }) },
	{ key = "j", mods = "CTRL|SHIFT", action = action.AdjustPaneSize({ "Down", 5 }) },
	{ key = "k", mods = "CTRL|SHIFT", action = action.AdjustPaneSize({ "Up", 5 }) },

	-- Zoom toggle
	{ key = "m", mods = "LEADER", action = action.TogglePaneZoomState },

	-- Pane navigation
	{ key = "h", mods = "LEADER", action = action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = action.ActivatePaneDirection("Right") },
	{ key = "j", mods = "LEADER", action = action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = action.ActivatePaneDirection("Up") },

	-- Copy mode
	{ key = "[", mods = "LEADER", action = action.ActivateCopyMode },

	-- Persistence
	{ key = "s", mods = "LEADER", action = action.EmitEvent("save-layout") },
	{ key = "r", mods = "LEADER", action = action.EmitEvent("restore-layout") },

	{
		key = ",",
		mods = "LEADER",
		action = action.PromptInputLine({
			description = "Enter new name for tab",
			action = action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

merge_tables(system_keys, resurrect_keys)

return system_keys
