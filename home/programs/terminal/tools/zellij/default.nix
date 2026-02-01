{ config, pkgs, ... }:
let
  homeDirectory = "${config.home.homeDirectory}";
  inherit (config.lib.file) mkOutOfStoreSymlink;
in {
  imports = [ ./layouts.nix ./themes.nix ];
  home.packages = with pkgs; [ zjstatus ];
  programs.zellij.enable = true;
  xdg.configFile."zellij/config.kdl".source = mkOutOfStoreSymlink
    "${homeDirectory}/dotfiles/home/programs/terminal/tools/zellij/config.kdl";
}
