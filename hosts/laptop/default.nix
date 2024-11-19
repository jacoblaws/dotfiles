{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../config/nixos/audio.nix
    ../../config/nixos/nvidia.nix
    ../../config/nixos/audio.nix
    ../../config/nixos/fonts.nix
    ../../config/nixos/hyprland.nix
    ../../config/nixos/greetd.nix
    ../../config/nixos/console.nix
  ];

  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  };
}
