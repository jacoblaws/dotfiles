{ osConfig, ... }: let
  inherit (osConfig) theme currentTheme;
  palette = theme.${currentTheme}.dark;
in {
  programs.kitty = {
    enable = true;

    font = {
      size = 15;
      name = "Recursive Mono Casual";
    };

    keybindings = {
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+shift+equal" = "change_font_size all +1.0";
      "ctrl+shift+minus" = "change_font_size all -1.0";
    };

    settings = {
      confirm_os_window_close = "0";
      resize_in_steps = "yes";
      placement_strategy = "center";
      window_padding_width = "0";
      clear_all_shortcuts = "yes";
    };
  };

  # color scheme
  programs.kitty.settings = {
    foreground = "#${palette.fg}";
    background = "#${palette.bg0}";
    selection_foreground = "#${palette.grey2}";
    selection_background = "#${palette.bg4}";

    cursor = "#${palette.fg}";
    cursor_text_color = "#${palette.bg1}";

    url_color = "#${palette.blue}";

    active_border_color = "#${palette.green}";
    inactive_border_color = "#${palette.bg5}";
    bell_border_color = "#${palette.orange}";
    visual_border_color = "none";

    wayland_titlebar_color = "system";
    macos_titlebar_color = "system";

    active_tab_foreground = "#${palette.fg}";
    active_tab_background = "#${palette.bgd}";
    inactive_tab_foreground = "#${palette.grey2}";
    inactive_tab_background = "#${palette.bg2}";
    tab_bar_background = "#${palette.bg1}";
    tab_bar_margin_color = "none";

    mark1_foreground = "#${palette.bg0}";
    mark1_background = "#${palette.blue}";
    mark2_foreground = "#${palette.bg0}";
    mark2_background = "#${palette.yellow}";
    mark3_foreground = "#${palette.bg0}";
    mark3_background = "#${palette.magenta}";

    # black
    color0 = "#${palette.bg1}";
    color8 = "#${palette.bg1}";

    # red
    color1 = "#${palette.red}";
    color9 = "#${palette.red}";

    # green
    color2  = "#${palette.green}";
    color10 = "#${palette.green}";

    # yellow
    color3  = "#${palette.yellow}";
    color11 = "#${palette.yellow}";

    # blue
    color4  = "#${palette.blue}";
    color12 = "#${palette.blue}";

    # magenta
    color5  = "#${palette.magenta}";
    color13 = "#${palette.magenta}";

    # cyan
    color6  = "#${palette.cyan}";
    color14 = "#${palette.cyan}";

    # white
    color7  = "#${palette.fg}";
    color15 = "#${palette.fg}";
  };
}
