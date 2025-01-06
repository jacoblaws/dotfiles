{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system/core/audio.nix
    ../../system/core/fonts.nix
    ../../system/core/greetd.nix
    ../../system/core/nvidia.nix
    ../../system/core/console.nix
    ../../system/programs/wayland/hyprland.nix
    ../../system/services/keyd.nix
  ];

  programs.steam.enable = true;
  programs.gamemode.enable = true;

  networking = {
    hostName = "desktop";
    networkmanager.enable = true;
  };
}
