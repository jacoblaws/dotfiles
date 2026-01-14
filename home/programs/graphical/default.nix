{ lib, pkgs, ... }:
let modulePaths = lib.extended.fs.modulePaths;
in {
  imports = (modulePaths [ ./apps ./wayland ]) ++ [ ./theme.nix ];
  home.packages = with pkgs; [
    anki
    aseprite
    blender
    calibre
    discord
    drawio
    firefox
    gnome-calculator
    godot
    libreoffice
    lutris
    nemo-with-extensions
    obsidian
    orca-slicer
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
}
