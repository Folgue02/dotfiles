local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Font
config.font_size = 13

-- Background
config.color_scheme = 'Gruvbox Dark (Gogh)'
config.window_background_opacity = 0.85
config.font = wezterm.font('Hack', {})

-- Enable wayland
config.enable_wayland = true

-- Shell
if wezterm.target_triple:find('windows') then
    config.default_prog = { 'powershell.exe' }
else
    config.default_prog = { 'nu' }
end

return config
