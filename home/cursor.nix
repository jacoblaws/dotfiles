{ pkgs, ... }:

{
  home.pointerCursor = {
    name = "Qogir";
    package = pkgs.qogir-icon-theme;

    gtk.enable = true;
    x11.enable = true;
    x11.defaultCursor = "Qogir";
  };
}
