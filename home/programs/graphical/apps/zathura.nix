{ lib, osConfig, pkgs, ... }:
let
  inherit (osConfig) themes;
  inherit (lib.extended.theme) genFiles;
  options = pal: ''
    set window-title-basename true
    set selection-clipboard   "clipboard"
    set font "Recursive Sans Linear Static"

    # Theme
    set notification-error-bg   "#${pal.bg0}"
    set notification-error-fg   "#${pal.red}"
    set notification-warning-bg "#${pal.bg0}"
    set notification-warning-fg "#${pal.orange}"
    set notification-bg         "#${pal.bg0}"
    set notification-fg         "#${pal.green}"

    set completion-bg           "#${pal.bg1}"
    set completion-fg           "#${pal.fg}"
    set completion-group-bg     "#${pal.bg2}"
    set completion-group-fg     "#${pal.grey0}"
    set completion-highlight-bg "#${pal.blue}"
    set completion-highlight-fg "#${pal.bg2}"

    set index-bg                "#${pal.bg0}"
    set index-fg                "#${pal.fg}"
    set index-active-bg         "#${pal.bg1}"
    set index-active-fg         "#${pal.yellow}"

    set inputbar-bg             "#${pal.bgd}"
    set inputbar-fg             "#${pal.fg}"

    set statusbar-bg            "#${pal.bgd}"
    set statusbar-fg            "#${pal.fg}"

    set highlight-color         "#${pal.green}"
    set highlight-active-color  "#${pal.yellow}"

    set default-bg              "#${pal.bg0}"
    set default-fg              "#${pal.fg}"

    set render-loading          true;
    set render-loading-fg       "#${pal.bg0}"
    set render-loading-bg       "#${pal.fg}"

    set recolor-lightcolor      "#${pal.bg0}"
    set recolor-darkcolor       "#${pal.fg}"

    # startup options
    adjust-open = "width";
    recolor = true;
    recolor-keephue = true;
  '';
  config = genFiles ".config/zathura" "" options themes;
in lib.recursiveUpdate config { home.packages = [ pkgs.zathura ]; }
