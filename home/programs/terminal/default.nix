{ pkgs, ... }: {
  imports = [ ./shell ./tools ];

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
    podman-compose
    podman-tui
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
  programs.zoxide.enable = true;
}
