{ pkgs, ... }: {
  imports = [
    ./anyrun
    ./hyprland
    ./waybar
  ];

  home.packages = with pkgs; [
    hyprpolkitagent
    nwg-look
    wl-clipboard
  ];
}
