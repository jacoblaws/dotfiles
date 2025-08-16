{ pkgs, ... }: {
  imports = [
    ./editors
    ./media
    ./office
    ./terminal
    ./themes
    ./wayland
  ];

  home.packages = with pkgs; [
    anki
    drawio
    firefox
    gnome-calculator
    libreoffice
    nemo
    obsidian
    orca-slicer
    protonvpn-gui
    zotero
  ];
}
