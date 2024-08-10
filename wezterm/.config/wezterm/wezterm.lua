local wezterm = require('wezterm')

local config = wezterm.config_builder()

config.font = wezterm.font('CaskaydiaCove Nerd Font Mono')
config.font_size = 13

config.color_scheme = 'Gruvbox Dark (Gogh)'

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.scrollback_lines = 9000

config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true
config.max_fps = 144

return config
