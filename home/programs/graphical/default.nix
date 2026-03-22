{ lib, pkgs, ... }:
let modulePaths = lib.extended.fs.modulePaths;
in {
  imports = modulePaths [ ./apps ./wayland ];
  home.packages = with pkgs; [
    anki
    aseprite
    blender
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
    unityhub
    winetricks
    xivlauncher
    zotero
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
