{ pkgs, ... }: {
  imports = [
    ./tools
    ./shell/fish.nix
    ./shell/starship.nix
    ./emulator/kitty
  ];

  home.packages = with pkgs; [
    lf
    fd
    fzf
    eza
    bat
    just
    ripgrep
    lazygit
    zip
    unzip
    unrar
    dive
    podman-tui
    podman-compose
    clipse
    protonvpn-cli
    yazi
    appimage-run
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
