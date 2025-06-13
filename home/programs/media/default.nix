{ pkgs, ... }: {
  imports = [
    ./tauon
  ];

  home.packages = with pkgs; [
    ffmpeg
    fluidsynth
    mpv
    soundfont-fluid
  ];

  programs.timidity.enable = true;
}
