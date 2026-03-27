{ pkgs, ... }:
{
  imports = [
    ./zen-browser
    ./sioyek.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    anki
    aseprite
    blender
    brave
    calibre
    discord
    drawio
    firefox
    foliate
    gnome-calculator
    godot
    libreoffice
    lutris
    mangohud
    mission-center
    nautilus
    nemo-with-extensions
    obsidian
    openmw
    orca-slicer
    papirus-icon-theme
    pavucontrol
    picard
    prismlauncher
    protonvpn-gui
    puredata
    pureref
    r2modman
    spotify
    ungoogled-chromium
    unityhub
    winetricks
    xivlauncher
    zotero
  ];
}
