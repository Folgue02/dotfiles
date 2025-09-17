local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Font
config.font_size = 13
--config.font = wezterm.font('IntoneMono Nerd Font', {})
config.font = wezterm.font("Agave Nerd Font", {weight="Regular", stretch="Normal", style="Normal"})

-- Background
config.color_scheme = 'Catppuccin Frappe'
config.window_background_opacity = 0.9


-- Enable wayland
config.enable_wayland = true

-- Shell
if wezterm.target_triple:find('windows') then
    config.default_prog = { 'powershell.exe' }
else
    config.default_prog = { 'nu' }
end

return config
