{ nixpkgs, pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # cli
    lf
    fd
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
    prismlauncher
    r2modman
    calibre
    lutris

    # wine
    winetricks
    inputs.nix-gaming.packages.${pkgs.system}.wine-ge
  ];

  nixpkgs.config.permittedInsecurePackages =
    pkgs.lib.optional (pkgs.obsidian.version == "1.5.3") "electron-25.9.0";
}
