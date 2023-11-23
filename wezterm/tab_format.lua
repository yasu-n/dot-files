local wezterm = require 'wezterm'

function tab_title(s)
    return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

wezterm.on(
    'format-tab-title',
    function(tab, tabs, panes, config, hover, max_width)
        local foreground = '#808080'
        local background = '#333333'

        if tab.is_active then
            foreground = '#aef359'
        end

        local title = tab_title(tab.active_pane.foreground_process_name)

        -- ensure that the titles fit in the available space,
        -- and that we have room for the edges.
        title = wezterm.truncate_right(title, max_width)

        return {
            { Attribute = { Underline = "Single" } },
            { Foreground = { Color = foreground } },
            { Background = { Color = background } },
            { Text = ' ' .. tab.tab_index + 1 .. ":" .. title .. ' ' },
        }
    end
)

return {}
