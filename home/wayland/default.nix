{ pkgs, ... }:
{
  imports = [
    ./gtk
    ./hyprland
    ./niri
    ./noctalia
  ];

  home.packages = with pkgs; [
    adw-gtk3
    gamescope
    glib
    gnome-themes-extra
    gtk-engine-murrine
    hyprpolkitagent
    nwg-look
    wl-clipboard
    xwayland-satellite
  ];

  home.pointerCursor = {
    name = "Qogir";
    package = pkgs.qogir-icon-theme;

    size = 24;
    gtk.enable = true;
    hyprcursor.enable = true;
    hyprcursor.size = 24;
    x11.enable = true;
    x11.defaultCursor = "Qogir";
  };
}
