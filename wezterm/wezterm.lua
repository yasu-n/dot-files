-- Pull in the wezterm API
local wezterm = require 'wezterm'
local keybinds = require 'keybinds'

-- This table will hold the configuration
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choice

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'

-- window
config.window_background_opacity = 0.7
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
}
config.window_close_confirmation = 'NeverPrompt'

-- color scheme
config.color_scheme = 'Night Owl (Gogh)'
--config.color_scheme = 'GitHub Dark'
--config.color_scheme = 'Google Dark (Gogh)'

-- font
config.font = wezterm.font 'SauceCodePro Nerd Font'
config.font_size = 10

-- keybind
keybinds.apply_to_config(config)
config.tab_bar_at_bottom = true

-- status bar
require 'status'

-- tab format 
require 'tab_format'
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.show_new_tab_button_in_tab_bar = false

-- and finally, return the configuration to wezterm
return config
