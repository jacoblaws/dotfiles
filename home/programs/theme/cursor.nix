{ pkgs, ... }: {
  home.pointerCursor = {
    name = "Qogir";
    package = pkgs.qogir-icon-theme;

    size = 24;
    gtk.enable = true;
    x11.enable = true;
    x11.defaultCursor = "Qogir";
    hyprcursor.enable = true;
    hyprcursor.size = 24;
  };
}
