{
  imports = [
    ../../programs/editors
    ../../programs/office
    ../../programs/terminal
    ../../programs/wayland/hyprland
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = "eDP-1, 1920x1080@60, auto, 1";
  };
}
