{ config, ...}: let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  homeDirectory = "${config.home.homeDirectory}";
in {
  programs.waybar = {
    enable = true;
  };

  xdg.configFile.waybar = {
    source = mkOutOfStoreSymlink "${homeDirectory}/dotfiles/home/programs/wayland/waybar";
  };
}
