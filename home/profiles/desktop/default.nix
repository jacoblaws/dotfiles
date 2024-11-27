{
  imports = [
    ../../programs/editors
    ../../programs/media
    ../../programs/office
    ../../programs/terminal
    ../../programs/wayland/ags
    ../../programs/wayland/hyprland
    ../../programs/wayland/waybar
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-1, 3440x1440@144, 0x0, 1, bitdepth, 10, vrr, 1"
      "DP-2, 2560x1440@144, 3440x0, 1, transform, 1, bitdepth, 10, vrr, 1"
    ];
  };
}
