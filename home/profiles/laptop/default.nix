{ config, ... }: let
  homeDir = config.home.homeDirectory;
in {
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1, 1920x1080@60, auto, 1"
      ", preferred, auto, 1"
    ];
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
