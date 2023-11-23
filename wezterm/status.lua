local wezterm = require 'wezterm'

local function get_date(elems)
    table.insert(elems, { Text = wezterm.strftime '%a %-d %b %Y' .. ' ' })
end

local function get_time(elems)
    table.insert(elems, { Text = wezterm.strftime '%H:%M' })
end


local function right_status(window, pane)
    local elems = {}
    get_date(elems)
    get_time(elems)
    window:set_right_status(wezterm.format(elems))
end

wezterm.on(
    'update-status',
    function(window, pane)
        right_status(window, pane)
    end
)
