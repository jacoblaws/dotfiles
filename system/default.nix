let
  core = [
    ./nix
    ./core
    ./core/console.nix
    ./core/fonts.nix

    ./services
    ./hardware/nvidia.nix
    ./programs/wayland/hyprland.nix

    ./services/keyd.nix
    ./services/xorg
    ./services/xorg/awesome.nix
  ];

  desktop = core ++ [
    ./programs/games.nix
  ];

  laptop = core ++ [];
in {
  inherit core desktop laptop;
}
