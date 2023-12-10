local wezterm = require"wezterm"
local mux = wezterm.mux
local act = wezterm.action

wezterm.on('gui-startup', function()
 local tab, pane, window = mux.spawn_window({})
 window:gui_window():maximize()
end)

return {
  -- Font settings
  font = wezterm.font_with_fallback {
    'FiraCode Nerd Font Mono',
    'Jetbrains Mono'
  },
  font_size = 18,

  color_scheme = "Gruvbox Dark",
  -- Tab bar
  show_tab_index_in_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  -- Window look
  window_decorations = "RESIZE",
  -- Wayland
  enable_wayland = true,
  inactive_pane_hsb = {
   saturation = 0.8,
   brightness = 0.7
  },
  window_frame = {
   font = wezterm.font { family = 'Noto Sans', weight = 'Regular' },
  },
  scrollback_lines = 26000,
  -- Keybindings
  -- disable_default_key_bindings = true,

  leader = { key = 'b', mods = 'CMD', timeout_milliseconds = 2000 },
}
