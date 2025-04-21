{ config, ... }: let
  homeDirectory = "${config.home.homeDirectory}";
  inherit (config.lib.file) mkOutOfStoreSymlink;
in {
  imports = [
    ./layouts
    ./theme
  ];

  programs.zellij.enable = true;

  xdg.configFile."zellij/config.kdl" = {
    source = mkOutOfStoreSymlink "${homeDirectory}/dotfiles/home/programs/terminal/tools/zellij/config.kdl";
  };
}
