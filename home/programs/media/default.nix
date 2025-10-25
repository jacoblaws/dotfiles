{ inputs, pkgs, ... }: {
  home.packages = with pkgs; [
    calibre
    discord
    lutris
    pavucontrol
    picard
    prismlauncher
    r2modman
    spotify
    winetricks
    xivlauncher
  ];
}
