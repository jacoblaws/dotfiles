{ ... }: {
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

    themeFile = "everforest_dark_medium";
  };
}
