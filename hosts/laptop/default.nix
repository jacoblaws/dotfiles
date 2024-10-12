{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../config/nixos/audio.nix
    ../../config/nixos/nvidia.nix
    ../../config/nixos/audio.nix
    ../../config/nixos/fonts.nix
    ../../config/nixos/hyprland.nix
  ];

  networking = {
    hostName = "nixos-laptop";
    networkmanager.enable = true;
  };
}
