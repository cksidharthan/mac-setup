local wezterm = require 'wezterm';

local config = wezterm.config_builder();

config.color_scheme = "Dark+";
config.use_fancy_tab_bar = true;
config.hide_tab_bar_if_only_one_tab = true;
config.window_background_opacity = 0.95;
config.bold_brightens_ansi_colors = true;

config.font_size = 15.0;
config.line_height = 1.2;
config.disable_default_key_bindings = true;

-- split the window horizontally and vertically
config.keys = {
    {key="|", mods="CTRL", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="\\", mods="CTRL", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
}
return config;
