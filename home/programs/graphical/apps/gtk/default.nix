{ config, osConfig, lib, pkgs, ... }:
let
  inherit (osConfig) themes;
  inherit (lib.extended.theme) genFiles toCss toGtkCss;
  gtk3Themes = genFiles ".config/gtk-3.0/themes" "" toGtkCss themes;
  gtk4Themes = genFiles ".config/gtk-4.0/themes" "" toCss themes;
  gtkThemes = lib.recursiveUpdate gtk3Themes gtk4Themes;

  inherit (config.home) homeDirectory;
  inherit (config.lib.file) mkOutOfStoreSymlink;
in lib.recursiveUpdate gtkThemes {
  gtk = {
    enable = true;

    font = {
      name = "Recursive Sans Casual Static";
      package = pkgs.recursive;
      size = 12;
    };

    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
  };

  xdg.configFile = {
    "gtk-3.0/gtk.css".text = ''@import url("styles/main.css");'';
    "gtk-4.0/gtk.css".text = ''@import url("styles/main.css");'';
    "gtk-3.0/styles".source = mkOutOfStoreSymlink
      "${homeDirectory}/dotfiles/home/programs/graphical/apps/gtk/gtk3-styles";
    "gtk-4.0/styles".source = mkOutOfStoreSymlink
      "${homeDirectory}/dotfiles/home/programs/graphical/apps/gtk/gtk4-styles";
  };
}
