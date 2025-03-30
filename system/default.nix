let
  core = [
    ./nix
    ./core
    ./core/console.nix
    ./core/fonts.nix

    ./services
    ./hardware/nvidia.nix
    ./programs/wayland/hyprland.nix
  ];

  desktop = core ++ [
    ./programs/games.nix
  ];

  laptop = core ++ [];
in {
  inherit core desktop laptop;
}
