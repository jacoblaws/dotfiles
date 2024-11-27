{
  imports = [
    ../../programs/editors
    ../../programs/media
    ../../programs/office
    ../../programs/terminal
    ../../programs/wayland/hyprland
    ../../programs/wayland/waybar
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = "eDP-1, 1920x1080@60, auto, 1";
  };
}
