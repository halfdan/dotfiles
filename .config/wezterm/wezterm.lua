local wezterm = require"wezterm"

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
  -- Window look
  window_decorations = "RESIZE",
  -- Wayland
  enable_wayland = true,
}
