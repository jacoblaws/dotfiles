{ pkgs, ... }: {
  imports = [
    ./ags
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
