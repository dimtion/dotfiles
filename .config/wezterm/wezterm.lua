-- Documentation: https://wezfurlong.org/wezterm/config/files.html
local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'rose-pine'
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font 'Hack Nerd Font Mono'

return config
