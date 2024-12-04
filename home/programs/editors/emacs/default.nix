{ pkgs, config, ... }: let
  homeDirectory = "${config.home.homeDirectory}";
  inherit (config.lib.file) mkOutOfStoreSymlink;
in {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs30-pgtk;
  };

  xdg.configFile = {
    emacs.source = mkOutOfStoreSymlink "${homeDirectory}/dotfiles/home/programs/editors/emacs/config";
  };
}
