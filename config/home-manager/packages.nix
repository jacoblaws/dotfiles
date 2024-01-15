{ nixpkgs, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # cli
    lf
    fd
    gh
    fzf
    eza
    bat
    tmux
    ripgrep
    lazygit
    zip
    unzip
    unrar
  ];
}
