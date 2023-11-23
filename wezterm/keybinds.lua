local wezterm = require 'wezterm'
local act = wezterm.action

local module = {
    -- timeout_milliseconds defaults to 1000 and can be omitted
    leader = { key = "s", mods = "CTRL", timeout_milliseconds = 1000 },
    keys = {
        { key = "'", mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
        { key = ";", mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
        { key = "c", mods = 'LEADER', action = act.SpawnCommandInNewTab {
            cwd = '~/',
            domain = 'CurrentPaneDomain',
        }, },
        { key = "C", mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },
        { key = "f", mods = 'LEADER', action = act.ToggleFullScreen },
        { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
        { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
        { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
        { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
        { key = 'w', mods = 'LEADER', action = act.CloseCurrentTab { confirm = true} },
        { key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState },
    },
}

local function move_tab_keys(keys, max_tabs)
    for i = 1, max_tabs do
        table.insert(keys, {
            key = tostring(i),
            mods = 'LEADER',
            action = act.ActivateTab(i - 1),
        })
    end
    return keys 
end

function module.apply_to_config(config)
    config.leader = module.leader
    config.keys = move_tab_keys(module.keys, 8)
end

return module
