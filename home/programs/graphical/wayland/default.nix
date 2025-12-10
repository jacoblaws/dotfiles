{ pkgs, ... }: {
  home.packages = with pkgs; [
    gamescope
    hyprpolkitagent
    wl-clipboard
    xwayland-satellite
  ];
}
