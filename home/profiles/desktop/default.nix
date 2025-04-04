{ config, ... }: let
  homeDir = config.home.homeDirectory;
in {
  imports = [
    ../../.
    ../../services
    ../../programs/editors
    ../../programs/media
    ../../programs/office
    ../../programs/terminal
    ../../programs/theme
    ../../programs/wayland/ags
    ../../programs/wayland/hyprland
    ../../programs/wayland/waybar
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-1, 3440x1440@144, 0x0, 1, bitdepth, 10, vrr, 0"
      "DP-2, 2560x1440@144, 3440x0, 1, transform, 1, bitdepth, 10, vrr, 0"
    ];
  };

  services.hyprpaper.settings = {
    preload = [
      "${homeDir}/media/images/wallpapers/uw/current.png"
      "${homeDir}/media/images/wallpapers/v/current.png"
    ];

    wallpaper = [
      "DP-1, ${homeDir}/media/images/wallpapers/uw/current.png"
      "DP-2, ${homeDir}/media/images/wallpapers/v/current.png"
    ];
  };
}
