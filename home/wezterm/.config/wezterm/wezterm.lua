-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Gruvbox Dark (Gogh)'

config.enable_wayland = false
config.enable_tab_bar = false
config.font_size = 12
config.font = wezterm.font("Monaspace Argon")

config.window_padding = {
  left = 6,
  right = 6,
  top = 6,
  bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
