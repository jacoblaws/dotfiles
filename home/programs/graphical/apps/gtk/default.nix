{ config, osConfig, lib, pkgs, ... }:
let
  inherit (osConfig) themes;
  inherit (lib.extended.theme) genFiles toCss toGtkCss;
  gtk3Themes = genFiles ".config/gtk-3.0/themes" ".css" toGtkCss themes;
  gtk4Themes = genFiles ".config/gtk-4.0/themes" ".css" toCss themes;
  gtkThemes = lib.recursiveUpdate gtk3Themes gtk4Themes;

  inherit (config.home) homeDirectory;
  inherit (config.lib.file) mkOutOfStoreSymlink;
in {
  home.programs = with pkgs; [
    adw-gtk3
    glib
    gnome-themes-extra
    gtk-engine-murrine
    nwg-look
  ];

  xdg.configFile = {
    "gtk-3.0/gtk.css".text = ''@import url("styles/main.css");'';
    "gtk-4.0/gtk.css".text = ''@import url("styles/main.css");'';
    "gtk-3.0/styles".source = mkOutOfStoreSymlink
      "${homeDirectory}/dotfiles/home/programs/graphical/apps/gtk/gtk3-styles";
  };
} // gtkThemes
