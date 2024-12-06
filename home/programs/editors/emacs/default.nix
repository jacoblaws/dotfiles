{ pkgs, config, ... }: let
  homeDirectory = "${config.home.homeDirectory}";
  inherit (config.lib.file) mkOutOfStoreSymlink;
in {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs30-pgtk;
  };

  home.sessionVariables = {
    "DOOMDIR" = "${homeDirectory}/dotfiles/home/programs/editors/emacs/doom";
    "DOOMLOCALDIR" = "${homeDirectory}/.local/share/doom-emacs";
  };

  xdg.configFile = {
    doom.source = mkOutOfStoreSymlink "${homeDirectory}/dotfiles/home/programs/editors/emacs/doom";
    emacs.source = mkOutOfStoreSymlink "${homeDirectory}/dotfiles/home/programs/editors/emacs/config";
  };
}
