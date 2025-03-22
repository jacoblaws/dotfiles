let
  core = [
    ./nix
    ./core
    ./core/audio.nix
    ./core/console.nix
    ./core/fonts.nix
    ./core/greetd.nix
    ./core/nvidia.nix

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
