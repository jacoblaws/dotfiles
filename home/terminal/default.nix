{ pkgs, ... }:
{
  imports = [
    ./ghostty
    ./kitty
    ./zellij
    ./shell.nix
    ./starship.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    appimage-run
    bat
    brightnessctl
    btop
    clipse
    dive
    eza
    fd
    fzf
    htop
    just
    lazygit
    lf
    podman-compose
    podman-tui
    ripgrep
    unrar
    unzip
    yazi
    zip
  ];
}
