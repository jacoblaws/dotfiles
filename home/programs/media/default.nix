{ inputs, pkgs, ... }: {
  imports = [
    ./tauon
  ];

  home.packages = with pkgs; [
    calibre
    discord
    ffmpeg
    fluidsynth
    inputs.nix-gaming.packages.${pkgs.system}.wine-ge
    lutris
    mpv
    pavucontrol
    picard
    prismlauncher
    r2modman
    soundfont-fluid
    spotify
    winetricks
    xivlauncher
  ];

  programs.timidity.enable = true;
}
