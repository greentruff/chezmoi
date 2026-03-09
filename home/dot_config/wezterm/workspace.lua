local module = {}

local wezterm = require("wezterm")
local act = wezterm.action

-- File to persist previously-opened workspaces
local history_file = wezterm.home_dir .. "/.local/state/wezterm/workspace.json"

local function read_history()
	local f = io.open(history_file, "r")
	if not f then
		return {}
	end
	local data = f:read("*a")
	f:close()
	local ok, result = pcall(wezterm.json_parse, data)
	if ok and type(result) == "table" then
		return result
	end
	return {}
end

local function write_history(history)
	local dir = wezterm.home_dir .. "/.local/state/wezterm"
	os.execute('mkdir -p "' .. dir .. '"')
	local f = io.open(history_file, "w")
	if not f then
		return
	end
	f:write(wezterm.json_encode(history))
	f:close()
end

local function save_workspace_to_history(name, cwd)
	local history = read_history()
	history[name] = cwd
	write_history(history)
end

local function workspace_choices()
	local active = wezterm.mux.get_workspace_names()
	local active_set = {}
	for _, name in ipairs(active) do
		active_set[name] = true
	end

	local known = {} -- name -> cwd
	local order = {} -- preserve ordering

	local history = read_history()
	for name, cwd in pairs(history) do
		if not known[name] then
			known[name] = cwd
			table.insert(order, name)
		end
	end

	for _, name in ipairs(active) do
		if not known[name] then
			known[name] = wezterm.home_dir
			table.insert(order, name)
		end
	end

	local choices = {}
	table.insert(choices, { label = "+ New workspace", id = "__new__" })
	for _, name in ipairs(order) do
		local label = name
		if active_set[name] then
			label = "● " .. name
		else
			label = "  " .. name
		end
		table.insert(choices, { label = label, id = name })
	end

	return choices, known
end

module.picker = function(window, pane)
	local choices, known = workspace_choices()

	window:perform_action(
		act.InputSelector({
			title = "Switch Workspace",
			fuzzy = true,
			choices = choices,
			action = wezterm.action_callback(function(window, pane, id, _label)
				if not id then
					return
				end
				if id == "__new__" then
					window:perform_action(
						act.PromptInputLine({
							description = "Enter directory path for new workspace",
							initial_value = pane:get_current_working_dir(),
							action = wezterm.action_callback(function(window, pane, line)
								if not line or line == "" then
									return
								end
								local cwd = line:gsub("^~", wezterm.home_dir)
								-- Use the last path component as the workspace name
								local name = cwd:match("([^/]+)$") or cwd
								save_workspace_to_history(name, cwd)
								window:perform_action(
									act.SwitchToWorkspace({
										name = name,
										spawn = { cwd = cwd },
									}),
									pane
								)
							end),
						}),
						pane
					)
					return
				end
				local cwd = known[id] or wezterm.home_dir
				save_workspace_to_history(id, cwd)
				window:perform_action(
					act.SwitchToWorkspace({
						name = id,
						spawn = { cwd = cwd },
					}),
					pane
				)
			end),
		}),
		pane
	)
end

return module
