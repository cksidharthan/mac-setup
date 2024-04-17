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

-- split the window horizontally
config.keys = {
    -- {key="|", mods="CTRL", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    -- split the window horizontally at the bottom with a line of 10
    {key="|", mods="CTRL", action=wezterm.action.SplitPane{
        direction = "Down",
        size = {
            Percent = 10,
        }
    }},
    {key="\\", mods="CTRL", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    -- toggle the horizontal split
    {key="-", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Up"}},
    -- Show the selector, using the quick_select_alphabet
    {key="o", mods="CTRL", action=wezterm.action{PaneSelect={}}},
     -- Show the selector, using your own alphabet
    {key="p", mods="CTRL", action=wezterm.action{PaneSelect={alphabet="0123456789"}}},
    -- use cmd + t to open a new tab
    {key="t", mods="CMD", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
}

config.window_padding = {
    bottom = 0,
}

return config;
