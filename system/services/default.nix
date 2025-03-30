{ pkgs, ... }: {
  imports = [
    ./greetd.nix
    ./pipewire.nix
  ];
}
