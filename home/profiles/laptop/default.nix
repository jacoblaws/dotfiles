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
    monitor = "eDP-1, 1920x1080@60, auto, 1";
  };

  services.hyprpaper.settings = {
    preload = [
      "${homeDir}/media/images/wallpapers/h/current.png"
    ];

    wallpaper = [
      "eDP-1, ${homeDir}/media/images/wallpapers/uw/current.png"
    ];
  };
}
