{ pkgs, ... }: {
  imports = [
    ./emulator
    ./shell
    ./tools
  ];

  home.packages = with pkgs; [
    appimage-run
    bat
    brightnessctl
    clipse
    dive
    eza
    fd
    fzf
    just
    lazygit
    lf
    lilypond
    podman-compose
    podman-tui
    protonvpn-cli
    ripgrep
    unrar
    unzip
    yazi
    zip
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
