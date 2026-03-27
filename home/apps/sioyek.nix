{
  lib,
  osConfig,
  pkgs,
  ...
}:
let
  inherit (osConfig) themes;
  inherit (lib.extended.theme) genFiles;
  options = pal: ''
    # Config options
    startup_commands toggle_custom_color;toggle_statusbar
    font_size 16
    ui_font Recursive Sans Linear Static
    collapsed_toc 1
    should_launch_new_window 1

    # Theme
    custom_text_color #${pal.fg}
    custom_background_color #${pal.bg0}
    custom_color_mode_empty_background_color #${pal.bgd}

    page_separator_width 10
    page_separator_color #${pal.bgd}

    status_bar_color #${pal.bgd}
    status_bar_text_color #${pal.yellow}
    status_bar_font_size 12

    ui_text_color #${pal.fg}
    ui_background_color #${pal.bgd}

    ui_selected_text_color #${pal.green}
    ui_selected_background_color #${pal.bg0}

    search_highlight_color #${pal.magenta}
  '';
  config = genFiles ".config/sioyek" "" options themes;
in
lib.recursiveUpdate config { home.packages = [ pkgs.sioyek ]; }
