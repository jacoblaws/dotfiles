let
  core = [
    ./nix
    ./core
    ./services
    ./hardware/nvidia.nix
    ./programs
    ./programs/wayland/hyprland.nix
  ];

  desktop = core ++ [
    ./programs/games.nix
  ];

  laptop = core ++ [];
in {
  inherit core desktop laptop;
}
