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

  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  };
}
