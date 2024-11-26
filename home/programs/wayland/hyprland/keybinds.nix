{
  wayland.windowManager.hyprland.settings = {
    bindm = [
      # mouse window control
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];

    bind = [
      # launcher
      "SUPER, Return, exec, kitty"
      "SUPER, r, exec, rofi -show drun"
      "SUPER, e, exec, nautilus"
      "SUPER, b, exec, firefox"
      "SUPER, s, exec, spotify"
      "SUPER, o, exec, WAYLAND_DISPLAY= obsidian"
      "SUPER, d, exec, discord"

      # close window | exit hyprland | reload hyprland
      "SUPER, q, killactive"
      "SUPER, c, killactive"
      "SUPER_SHIFT, c, exit"
      "SUPER_SHIFT, q, exit"
      "SUPER_SHIFT, r, exec, hyprctl reload"

      # window focus
      "SUPER, h, movefocus, l"
      "SUPER, j, movefocus, d"
      "SUPER, k, movefocus, u"
      "SUPER, l, movefocus, r"

      # window navigation
      "SUPER_SHIFT, h, movewindow, l"
      "SUPER_SHIFT, j, movewindow, d"
      "SUPER_SHIFT, k, movewindow, u"
      "SUPER_SHIFT, l, movewindow, r"

      # floating windows
      "SUPER, Space, toggleFloating"

      # fullscreen windows
      "SUPER, f, fullscreen"

      # pseudo/split windows
      "SUPER, c, pseudo"
      "SUPER, v, togglesplit"

      # workspace cycle
      "SUPER, Tab, workspace, e+1"
      "SUPER, grave, workspace, e-1"
      "SUPER, mouse_down, workspace, e+1"
      "SUPER, mouse_up, workspace, e-1"

      # workspace navigation
      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"
      "SUPER, 6, workspace, 6"
      "SUPER, 7, workspace, 7"
      "SUPER, 8, workspace, 8"
      "SUPER, 9, workspace, 9"
      "SUPER, grave, workspace, togglespecialworkspace"

      # move active window to a workspace
      "SUPER_SHIFT, 1, movetoworkspace, 1"
      "SUPER_SHIFT, 2, movetoworkspace, 2"
      "SUPER_SHIFT, 3, movetoworkspace, 3"
      "SUPER_SHIFT, 4, movetoworkspace, 4"
      "SUPER_SHIFT, 5, movetoworkspace, 5"
      "SUPER_SHIFT, 6, movetoworkspace, 6"
      "SUPER_SHIFT, 7, movetoworkspace, 7"
      "SUPER_SHIFT, 8, movetoworkspace, 8"
      "SUPER_SHIFT, 9, movetoworkspace, 9"
      "SUPER_SHIFT, grave, movetoworkspace, special"
    ];
  };
}
