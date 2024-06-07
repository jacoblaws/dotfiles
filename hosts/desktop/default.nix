{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../config/nixos/audio.nix
    ../../config/nixos/nvidia.nix
    ../../config/nixos/audio.nix
    ../../config/nixos/fonts.nix
    ../../config/nixos/gnome.nix
    ../../config/nixos/hyprland.nix
  ];

  programs.steam.enable = true;
  programs.gamemode.enable = true;

  networking = {
    hostName = "nixos-desktop";
    networkmanager.enable = true;
  };
}
