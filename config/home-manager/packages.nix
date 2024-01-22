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

    # gui
    firefox
    spotify
    discord
    obsidian
    pavucontrol
  ];

  nixpkgs.config.permittedInsecurePackages =
    pkgs.lib.optional (pkgs.obsidian.version == "1.5.3") "electron-25.9.0";
}
