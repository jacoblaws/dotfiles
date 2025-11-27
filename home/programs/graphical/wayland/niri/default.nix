{ config, ... }:
let
  inherit (config.home) homeDirectory;
  inherit (config.lib.file) mkOutOfStoreSymlink;
  niriPath = "${homeDirectory}/dotfiles/home/programs/graphical/wayland/niri";
in {
  xdg.configFile."niri/config.kdl".source =
    mkOutOfStoreSymlink "${niriPath}/config.kdl";
}
