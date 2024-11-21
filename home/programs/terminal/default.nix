{ ... }: {
  imports = [
    ./shell/fish.nix
    ./shell/starship.nix
    ./emulator/kitty.nix
    ./tools/tmux.nix
  ];
}
