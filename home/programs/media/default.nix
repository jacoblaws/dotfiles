{ inputs, pkgs, ... }: {
  imports = [
    ./tauon
  ];

  home.packages = with pkgs; [
    calibre
    discord
    ffmpeg
    fluidsynth
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
