local wezterm = require("wezterm")
local act = wezterm.action

local workspace = require("workspace")

wezterm.on("workspace-picker", workspace.picker)

wezterm.on("update-status", function(window, _pane)
	local w = wezterm.mux.get_active_workspace()

	window:set_left_status("[" .. w .. "]")
	window:set_right_status("")
end)

local config = {}

config.window_decorations = "RESIZE"

config.keys = {
	{ key = "LeftArrow", mods = "CMD", action = act.ActivateTabRelative(-1) },
	{ key = "RightArrow", mods = "CMD", action = act.ActivateTabRelative(1) },
	-- Allow Shift+Enter to insert newlines in Claude Code
	{ key = "Enter", mods = "SHIFT", action = act.SendString("\x1b[13;2u") },
	-- Workspace picker
	{ key = "p", mods = "CMD", action = act.EmitEvent("workspace-picker") },
}

return config
