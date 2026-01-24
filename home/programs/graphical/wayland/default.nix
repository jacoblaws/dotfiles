{ pkgs, ... }: {
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
}
