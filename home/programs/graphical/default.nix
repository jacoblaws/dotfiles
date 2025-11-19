{ lib, pkgs, ... }:
let modulePaths = lib.extended.fs.modulePaths;
in {
  imports = (modulePaths [ ./apps ./wayland ]) ++ [ ./theme.nix ];
  home.packages = with pkgs; [
    anki
    calibre
    discord
    drawio
    firefox
    gnome-calculator
    libreoffice
    lutris
    nemo
    obsidian
    orca-slicer
    pavucontrol
    picard
    prismlauncher
    protonvpn-gui
    r2modman
    spotify
    winetricks
    xivlauncher
    zotero
  ];
}
