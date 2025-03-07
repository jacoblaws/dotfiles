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
    ../../system/services/xorg
    ../../system/services/xorg/awesome.nix
    ../../system/programs/games.nix
  ];

  networking = {
    hostName = "desktop";
    networkmanager.enable = true;
  };
}
