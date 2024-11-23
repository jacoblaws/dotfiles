{ ... }: {
  programs.sioyek = {
    enable = true;
    config = {
      "startup_commands" = "toggle_custom_color;toggle_statusbar";
      "font_size" = "16";
      "ui_font" = "JetBrainsMono SymbolsNerdFontMono";
      "collapsed_toc" = "1";
      "should_launch_new_window" = "1";

      # everforest colorscheme
      "custom_text_color" = "#d3c6aa";
      "custom_background_color" = "#2d353b";
      "custom_color_mode_empty_background_color" = "#232a2e";

      "page_separator_width" = "10";
      "page_separator_color" = "#232a2e";

      "status_bar_color" = "#232a2e";
      "status_bar_text_color" = "#dbbc7f";
      "status_bar_font_size" = "12";

      "ui_text_color" = "#d3c6aa";
      "ui_background_color" = "#232a2e";

      "ui_selected_text_color" = "#a7c080";
      "ui_selected_background_color" = "#2d353b";

      "search_highlight_color" = "#d699b6";
    };
  };
}
