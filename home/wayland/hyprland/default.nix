{ config, ... }:
let
  inherit (config.home) homeDirectory;
  inherit (config.lib.file) mkOutOfStoreSymlink;
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = # lua
      ''
        require('keybinds')
        require('settings')
      '';
  };

  xdg.configFile = {
    "hypr/keybinds.lua".source =
      mkOutOfStoreSymlink "${homeDirectory}/dotfiles/home/wayland/hyprland/keybinds.lua";

    "hypr/settings.lua".source =
      mkOutOfStoreSymlink "${homeDirectory}/dotfiles/home/wayland/hyprland/settings.lua";
  };
}
