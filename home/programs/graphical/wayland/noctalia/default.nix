{ config, inputs, lib, ... }:
let
  inherit (config.home) homeDirectory;
  inherit (config.lib.file) mkOutOfStoreSymlink;
  modulePaths = lib.extended.fs.modulePaths;
in {
  imports = [ inputs.noctalia.homeModules.default ] ++ modulePaths [ ./themes ];
  programs.noctalia-shell = { enable = true; };
  xdg.configFile = {
    "noctalia/plugins.json".source = mkOutOfStoreSymlink
      "${homeDirectory}/dotfiles/home/programs/graphical/wayland/noctalia/plugins.json";
    "noctalia/settings.json".source = mkOutOfStoreSymlink
      "${homeDirectory}/dotfiles/home/programs/graphical/wayland/noctalia/settings.json";
  };
}
